# --- PERBAIKAN UTAMA ---
FROM ghcr.io/dockur/windows

# Metadata
LABEL maintainer="User Github"
LABEL description="Optimized Windows 11 ARM64 for Oracle Cloud (Ampere A1)"
LABEL org.opencontainers.image.source="https://github.com/dockur/windows"

# --- SYSTEM RESOURCES ---
ENV RAM_SIZE="13G"
ENV CPU_CORES="3"
ENV DISK_SIZE="64G"

# --- WINDOWS VERSION ---
ENV VERSION="win11"
ENV TINY="win11"

# --- REGION ---
ENV REGION="en-US"
ENV KEYBOARD="en-US"

# --- DRIVER & PERFORMANCE ---
ENV DISK_DRIVER="virtio"
ENV NET_DRIVER="virtio"
ENV VIDEO_DRIVER="virtio"
ENV RDP_TIMEOUT="0"

# --- AUTOMATION ---
ENV ACCEPT_EULA="Y"
ENV MANUAL="N"

# --- KHUSUS VPS TANPA KVM ---
# Ini yang menyebabkan error loop tadi.
# Kita set "N" agar dia mau jalan dengan mode emulasi software.
ENV KVM="N"

# --- QEMU FLAGS ---
ENV ARGUMENTS="-device virtio-balloon-pci,deflate-on-oom=on"

EXPOSE 8006 3389
VOLUME /storage
