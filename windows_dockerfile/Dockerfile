# Use a Windows base image
FROM dockurr/windows AS builder

# Set timezone environment variable
ENV TZ=UTC

# Install required tools and dependencies
RUN powershell -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Install-PackageProvider -Name NuGet -Force; \
    Install-Module -Name PackageManagement -Force -Scope AllUsers; \
    Install-Package -Name "BuildTools" -Source "https://chocolatey.org/api/v2/" -Force; \
    choco install git cmake nasm python bison --no-progress -y && \
    choco install libx11 libxft libxext libtool libxrandr libxi libxcursor libxdamage libxinerama libdrm --no-progress -y && \
    choco install curl zip unzip tar autoconf gdb --no-progress -y

# Create a non-admin user
ARG UID=1000
RUN net user builder /add /active:yes && \
    net localgroup "Administrators" builder /delete && \
    powershell -Command New-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name "EnableLUA" -Value 0 -PropertyType DWord

# Switch to the new user
USER builder
WORKDIR /home/builder
