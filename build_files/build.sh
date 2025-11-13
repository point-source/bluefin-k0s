#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

# Get the latest stable k0s version
K0S_VERSION=$(curl -sSLf "https://docs.k0sproject.io/stable.txt")

echo "Installing k0s version: ${K0S_VERSION}"

# Download the k0s binary for the latest stable release
curl -sSLf "https://github.com/k0sproject/k0s/releases/download/${K0S_VERSION}/k0s-${K0S_VERSION}-amd64" -o /tmp/k0s

# Install to /usr/local/bin
install -m 755 /tmp/k0s /usr/bin/k0s

# Clean up
rm /tmp/k0s

echo "k0s ${K0S_VERSION} installed successfully"