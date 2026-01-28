# --- PERBAIKAN UTAMA ---
# Gunakan ghcr.io karena docker.io sudah tidak bisa diakses untuk image ini
FROM ghcr.io/dockur/windows

# Metadata
LABEL maintainer="User Github"
LABEL description="Optimized Windows 11 ARM64 for Oracle Cloud (Ampere A1)"
LABEL org.opencontainers.image.source="https://github.com/dockur/windows"

# --- SYSTEM RESOURCES (Oracle Free Tier Optimization) ---
# RAM: 18GB untuk Windows
ENV RAM_SIZE="18G"

# CPU: Gunakan semua 4 Core Ampere A1
ENV CPU_CORES="4"

# Disk: 64GB
ENV DISK_SIZE="64G"

# --- WINDOWS VERSION & OPTIMIZATION ---
ENV VERSION="win11"

# TINY Mode: Wajib untuk ARM agar ringan
ENV TINY="win11"

# --- REGION & USER ---
ENV REGION="en-US"
ENV KEYBOARD="en-US"

# --- DRIVER & PERFORMANCE ---
ENV DISK_DRIVER="virtio"
ENV NET_DRIVER="virtio"
ENV VIDEO_DRIVER="virtio"

# Mencegah disconnect
ENV RDP_TIMEOUT="0"

# Otomatis setuju EULA
ENV ACCEPT_EULA="Y"
ENV MANUAL="N"

# --- QEMU ADVANCED FLAGS ---
# Optimasi memori ballooning
ENV ARGUMENTS="-device virtio-balloon-pci,deflate-on-oom=on"

# Expose ports
EXPOSE 8006 3389

# Volume persistence
VOLUME /storage
