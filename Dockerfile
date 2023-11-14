# Use the BlackArch base image
FROM kalilinux/kali-rolling:latest

# Install SSH server
apt update && apt -y install openssh-server && apt -y install openssh-client

# Set root password (replace 'your_password' with your desired password)
RUN echo 'root:sudo' | chpasswd

# Enable root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["service", "ssh" ,"start"]
