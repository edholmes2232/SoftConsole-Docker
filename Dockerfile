FROM ubuntu:22.04

# Stop apt from prompting for timezone etc
ENV DEBIAN_FRONTEND=noninteractive

# Update apt and install minimal graphical/system dependencies for Eclipse-based SoftConsole
RUN dpkg --add-architecture i386 && \
    apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    wget curl ca-certificates bash make git zip unzip bzip2 xz-utils \
    libglib2.0-0 libgtk-3-0 libnss3 libxss1 libasound2 libsecret-1-0 \
    libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxi6 \
    libxrandr2 libxtst6 libdbus-1-3 libfontconfig1 libpango-1.0-0 \
    libpcre3 libpcre2-8-0 liblz4-1 liblzma5 libzstd1 libxxhash0 \
    libc6:i386 libstdc++6:i386 libgcc-s1:i386 python3 libwebkit2gtk-4.0-37 \
    libyaml-dev libelf-dev libssl-dev mono-devel mono-complete \  
    && rm -rf /var/lib/apt/lists/*

# Install SoftConsole from external build context
RUN --mount=type=bind,from=softconsole-installer,target=/mnt/softconsole \
    cd /mnt/softconsole/ && \
    ./Microchip-SoftConsole-v2022.2-RISC-V-747-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui none \
    --prefix /usr/local/microchip/SoftConsole-v2022.2

# Set PATH to include RISC-V Toolchains
ENV PATH="/usr/local/microchip/SoftConsole-v2022.2/riscv-unknown-elf-gcc/bin:${PATH}"
ENV SC_INSTALL_DIR=/usr/local/microchip/SoftConsole-v2022.2


CMD ["/bin/bash"]
