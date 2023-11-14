# Use the BlackArch base image
FROM blackarchlinux/blackarch:latest

# Install OpenSSH server
RUN pacman -Sy --noconfirm openssh

# Set root password (replace 'your_password' with your desired password)
RUN echo 'root:your_password' | chpasswd

# Enable root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/bin/sshd", "-D"]
