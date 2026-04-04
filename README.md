# Microchip SoftConsole Standalone

A lightweight, purely open-source RISC-V compiling container utilizing Microchip's SoftConsole IDE/CLI tooling.

SoftConsole can be directly run from `/usr/local/microchip/SoftConsole-v2022.2/softconsole.sh`

## Quick Start

Pull the prebuilt image and start compiling immediately:

```bash
docker pull edholmes2232/softconsole:2022.2
docker run -it --rm -v $(pwd):/workspace -w /workspace edholmes2232/softconsole:2022.2 riscv64-unknown-elf-gcc --version
```

## Build from Source

You only need the SoftConsole installer (e.g. `Microchip-SoftConsole-v2022.2-RISC-V-747-linux-x64-installer.run`) in a directory:

```bash
docker build \
    --build-context softconsole-installer=~/Downloads/SoftConsole \
    -t edholmes2232/softconsole:2022.2 .
```

## Usage

```bash
docker run -it --rm -v $(pwd):/workspace -w /workspace edholmes2232/softconsole:2022.2 riscv64-unknown-elf-gcc --version
```

The `riscv64-unknown-elf-gcc` compiler is on the `$PATH`.

## DevContainer

A ready-made `.devcontainer/devcontainer.json` is included. Open the repo in VS Code and select **Reopen in Container** to get a full development environment with C/C++ tooling.

The devcontainer supports three image sources. Edit `devcontainer.json` and uncomment the one you need:

| Option | Config key | When to use |
|--------|-----------|-------------|
| **GHCR** (default) | `"image": "ghcr.io/edholmes2232/softconsole:2022.2"` | Fastest, pre-built |
| Docker Hub | `"image": "docker.io/edholmes2232/softconsole:2022.2"` | Alternative registry |
| Local build | `"build": { ... }` | You have the installer locally |

## Versioning

Image tags match the upstream **Microchip SoftConsole** release version (e.g. `2022.2`).

## License

[MIT](LICENSE)
