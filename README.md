# Microchip SoftConsole Standalone

A lightweight, purely open-source RISC-V compiling container utilizing Microchip's SoftConsole IDE/CLI tooling. 
No FlexLM license daemons, no 40GB synthesis FPGA tools. Just firmware compiling.

## Build

You only need the SoftConsole installer (e.g. `Microchip-SoftConsole-v2022.2-RISC-V-747-linux-x64-installer.run`) in a directory:

```bash
docker build \
    --build-context softconsole-installer=~/Downloads/SoftConsole \
    -t softconsole:latest .
```

## Usage

```bash
docker run -it --rm -v $(pwd):/workspace -w /workspace softconsole:latest make
```

You can now compile RISC-V bare-metal firmware instantly using the `riscv64-unknown-elf-gcc` compiler provided in the `$PATH`.
