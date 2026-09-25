# Cheat Engine

A fork of [Cheat Engine](https://github.com/cheat-engine/cheat-engine) with GitHub Actions workflows for Windows builds and releases.

[Versi Bahasa Indonesia](README_id.md)

## Releases

Releases are available at:

https://github.com/AzeoLXC/cheat-engine/releases

Published Windows assets:

- x86
- x64

File name format:

```text
Cheat-Engine_v<version>_<yyyymmdd>_<commit>_x86.exe
Cheat-Engine_v<version>_<yyyymmdd>_<commit>_x64.exe
```

## Build from GitHub Web

1. Open the **Actions** tab.
2. Select **Build and release Cheat Engine**.
3. Click **Run workflow**.
4. Select the `master` branch.
5. Enter a `release_tag`, for example `v7.5.0-2`.
6. Run the workflow.

The workflow will:

- check out the repository source;
- install Lazarus 2.2.2 and FPC 3.2.2;
- build the `Release 32-Bit` and `Release 64-Bit` modes;
- create Windows x86 and x64 release assets;
- create a GitHub Release for the selected tag.

## Local build

The main build uses Lazarus 2.2.2 and FPC 3.2.2.

1. Install Lazarus 2.2.2 for 64-bit Windows.
2. Install the `cross-i386-win32-win64` cross compiler.
3. Open `Cheat Engine/cheatengine.lpi` in Lazarus.
4. Select the `Release 32-Bit` or `Release 64-Bit` build mode.
5. Build the project.

Output is written to `Cheat Engine/bin`.

Command-line build with `lazbuild`:

```text
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 32-Bit"
lazbuild "Cheat Engine/cheatengine.lpi" --build-mode="Release 64-Bit"
```

## Upstream

- Website: https://www.cheatengine.org
- Upstream source: https://github.com/cheat-engine/cheat-engine
- Forum: https://forum.cheatengine.org
