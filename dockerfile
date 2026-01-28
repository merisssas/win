# Base image terbaik untuk QEMU-KVM Docker
FROM dockur/windows

# Metadata
LABEL maintainer="User Github"
LABEL description="Optimized Windows 11 ARM64 for Oracle Cloud (Ampere A1)"
LABEL org.opencontainers.image.source="https://github.com/dockur/windows"

# --- SYSTEM RESOURCES (Oracle Free Tier Optimization) ---
# RAM: 18GB untuk Windows, sisa 6GB untuk Host OS (Safety buffer)
ENV RAM_SIZE="18G"

# CPU: Gunakan semua 4 Core Ampere A1
ENV CPU_CORES="4"

# Disk: 64GB (Standar cukup untuk Windows 11 + Apps)
ENV DISK_SIZE="64G"

# --- WINDOWS VERSION & OPTIMIZATION (The Secret Sauce) ---
# Menggunakan "win11"
ENV VERSION="win11"

# [PENTING] TINY Mode:
# Nilai "win11" akan memicu script debloat otomatis (Tiny11).
# Ini akan membuang Telemetry, Edge, Defender berlebih, dll.
# Sangat direkomendasikan untuk CPU ARM agar tidak berat di idle.
ENV TINY="win11"

# --- REGION & USER ---
ENV REGION="en-US"
ENV KEYBOARD="en-US"
# Password default user (docker). Kosongkan jika ingin set manual nanti.
# ENV PASSWORD="PasswordRahasia123"

# --- DRIVER & PERFORMANCE ---
# Menggunakan VirtIO untuk performa maksimal di KVM
ENV DISK_DRIVER="virtio"
ENV NET_DRIVER="virtio"
ENV VIDEO_DRIVER="virtio"

# Mencegah disconnect RDP saat idle lama
ENV RDP_TIMEOUT="0"

# Otomatis setuju EULA & Instalasi tanpa intervensi
ENV ACCEPT_EULA="Y"
ENV MANUAL="N"

# --- QEMU ADVANCED FLAGS ---
# Flags tambahan untuk stabilitas ARM64
# -high-priority: Memberikan prioritas proses
ENV ARGUMENTS="-device virtio-balloon-pci,deflate-on-oom=on"

# Expose ports
EXPOSE 8006 3389

# Volume persistence
VOLUME /storage
