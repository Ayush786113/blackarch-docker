# Use the BlackArch base image
FROM blackarchlinux/blackarch:latest

# Install Keyrings
RUN pacman -Sy --noconfirm archlinux-keyring

# Initialise Keyrings
RUN pacman-key --init

# Populate Keyrings
RUN pacman-key --populate

# Install OpenSSH server
RUN pacman -Sy --noconfirm openssh

# Set root password (replace 'your_password' with your desired password)
RUN echo 'root:sudo' | chpasswd

# Enable root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["sudo", "systemctl", "start", "sshd.service"]
