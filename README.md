# Cheat Engine

Fork dari [Cheat Engine](https://github.com/cheat-engine/cheat-engine) dengan workflow GitHub Actions untuk build dan release Windows.

## Release

Release tersedia di:

https://github.com/AzeoLXC/cheat-engine/releases

Asset Windows yang dipublikasikan:

- x86
- x64

Format nama file:

```text
Cheat-Engine_v<version>_<yyyymmdd>_<commit>_x86.exe
Cheat-Engine_v<version>_<yyyymmdd>_<commit>_x64.exe
```

## Build dari GitHub Web

1. Buka tab **Actions**.
2. Pilih **Build and release Cheat Engine**.
3. Klik **Run workflow**.
4. Pilih branch `master`.
5. Isi `release_tag`, misalnya `v7.5.0-2`.
6. Jalankan workflow.

Workflow akan:

- mengambil source repository;
- memasang Lazarus 2.2.2 dan FPC 3.2.2;
- build mode `Release 32-Bit` dan `Release 64-Bit`;
- membuat asset release Windows x86 dan x64;
- membuat GitHub Release untuk tag yang dipilih.

## Build lokal

Build utama menggunakan Lazarus 2.2.2 dan FPC 3.2.2.

1. Install Lazarus 2.2.2 untuk Windows 64-bit.
2. Install cross compiler `cross-i386-win32-win64`.
3. Buka `Cheat Engine/cheatengine.lpi` di Lazarus.
4. Pilih build mode `Release 32-Bit` atau `Release 64-Bit`.
5. Jalankan build.

Output masuk ke `Cheat Engine/bin`.

Build dari command line menggunakan `lazbuild`:

```text
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 32-Bit"
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 64-Bit"
```

## Upstream

- Website: https://www.cheatengine.org
- Source upstream: https://github.com/cheat-engine/cheat-engine
- Forum: https://forum.cheatengine.org
