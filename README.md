# Cheat Engine — AzeoLXC fork

This repository is a Windows-focused fork of [Cheat Engine](https://github.com/cheat-engine/cheat-engine). It keeps the upstream Lazarus/Free Pascal application and adds a GitHub Actions workflow for building and publishing x86 and x64 releases. Releases from this repository are maintained separately from official Cheat Engine releases.

[Bahasa Indonesia](README_id.md)

## Repository layout

- `Cheat Engine/` — Lazarus project, application source, Lua runtime and scripts, language files, and bundled runtime resources.
- `DBKKernel/` — source for the Windows kernel driver components.
- `dbvm/` and `DBVM UEFI/` — DBVM and UEFI related source.
- `Cheat Engine/sfx/` — self-extractor and trainer-generation support projects.
- `.github/workflows/build-release.yml` — Windows CI build and release packaging.

The main application project is `Cheat Engine/cheatengine.lpi`. Its release build modes include `Release 32-Bit` and `Release 64-Bit`.

## Build locally

The configured release workflow uses Lazarus 2.2.2 with FPC 3.2.2. For a 64-bit Windows build, install that Lazarus/FPC version, then run:

```powershell
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 64-Bit"
```

For the 32-bit build from a 64-bit Windows toolchain, install the `cross-i386-win32-win64` cross compiler and run:

```powershell
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 32-Bit"
```

The project writes its executable and language resources under `Cheat Engine/bin`. The workflow builds both modes on `windows-2022` and packages the resulting `bin` contents as x86 and x64 self-extracting 7-Zip executables. It does not build every project under `DBKKernel/`, `dbvm/`, or `Cheat Engine/sfx/` as separate workflow jobs.

## GitHub Actions releases

The `Build and release Cheat Engine` workflow can be started manually with `workflow_dispatch`, or by pushing a tag matching `v*`.

For a manual run, open **Actions → Build and release Cheat Engine → Run workflow**. Optionally provide `release_tag` (for example, `v7.5.0-2`). The workflow builds the 32-bit and 64-bit application, creates two self-extracting EXE assets, and uploads them as a workflow artifact. If the run has a tag or a non-empty `release_tag`, it also creates a GitHub Release for that tag.

Release assets are published at [github.com/AzeoLXC/cheat-engine/releases](https://github.com/AzeoLXC/cheat-engine/releases). The application menu item **View AzeoLXC releases** opens this page; the fork does not poll the upstream Cheat Engine version service.

## Upstream

- Source project: [cheat-engine/cheat-engine](https://github.com/cheat-engine/cheat-engine)
- Official website: [cheatengine.org](https://cheatengine.org)
- Fork releases and changes: [AzeoLXC/cheat-engine](https://github.com/AzeoLXC/cheat-engine)
