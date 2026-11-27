# Cheat Engine — fork AzeoLXC

Repository ini adalah fork Windows dari [Cheat Engine](https://github.com/cheat-engine/cheat-engine). Source aplikasi Lazarus/Free Pascal tetap menjadi basisnya. Perubahan distribusi di fork ini mencakup workflow GitHub Actions untuk build dan publikasi rilis x86 serta x64. Rilis fork dikelola terpisah dari rilis resmi Cheat Engine.

[English](README.md)

## Struktur repository

- `Cheat Engine/` — project Lazarus, source aplikasi, runtime dan script Lua, file bahasa, serta resource runtime.
- `DBKKernel/` — source komponen driver kernel Windows.
- `dbvm/` dan `DBVM UEFI/` — source terkait DBVM dan UEFI.
- `Cheat Engine/sfx/` — project self-extractor dan dukungan pembuatan trainer.
- `.github/workflows/build-release.yml` — workflow CI Windows untuk build dan packaging rilis.

Project aplikasi utama adalah `Cheat Engine/cheatengine.lpi`. Build mode rilis yang dipakai workflow adalah `Release 32-Bit` dan `Release 64-Bit`.

## Build lokal

Workflow rilis menggunakan Lazarus 2.2.2 dan FPC 3.2.2. Untuk build 64-bit pada Windows, install versi tersebut lalu jalankan:

```powershell
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 64-Bit"
```

Untuk build 32-bit dari toolchain Windows 64-bit, install cross compiler `cross-i386-win32-win64`, lalu jalankan:

```powershell
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 32-Bit"
```

Project menulis executable dan resource bahasa ke `Cheat Engine/bin`. Workflow membangun kedua mode di `windows-2022`, lalu mengemas isi direktori `bin` menjadi self-extracting executable 7-Zip x86 dan x64. Workflow tersebut tidak membangun setiap project di `DBKKernel/`, `dbvm/`, atau `Cheat Engine/sfx/` sebagai job terpisah.

## Rilis GitHub Actions

Workflow `Build and release Cheat Engine` dapat dijalankan manual melalui `workflow_dispatch` atau otomatis saat tag dengan pola `v*` didorong.

Untuk menjalankan manual, buka **Actions → Build and release Cheat Engine → Run workflow**. Isian `release_tag` bersifat opsional, contohnya `v7.5.0-2`. Workflow membangun aplikasi 32-bit dan 64-bit, membuat dua asset EXE self-extracting, lalu mengunggahnya sebagai artifact. Jika run menggunakan tag atau `release_tag` tidak kosong, workflow juga membuat GitHub Release untuk tag tersebut.

Asset rilis tersedia di [github.com/AzeoLXC/cheat-engine/releases](https://github.com/AzeoLXC/cheat-engine/releases). Menu aplikasi **View AzeoLXC releases** membuka halaman tersebut; fork ini tidak melakukan polling ke layanan versi upstream Cheat Engine.

## Upstream

- Project sumber: [cheat-engine/cheat-engine](https://github.com/cheat-engine/cheat-engine)
- Situs resmi: [cheatengine.org](https://cheatengine.org)
- Rilis dan perubahan fork: [AzeoLXC/cheat-engine](https://github.com/AzeoLXC/cheat-engine)
