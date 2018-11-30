#!/bin/bash -eux

ubuntu_version="`lsb_release -r | awk '{print $2}'`";
ubuntu_major_version="`echo $ubuntu_version | awk -F. '{print $1}'`";

# Disable release-upgrades
sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades;

# Update package list
apt-get -y update;
# apt-transport-https not needed in Bionic Beaver
# apt-get install -y apt-transport-https;

# Disable periodic apt updates
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10disable-periodic;

# Upgrade all installed packages incl. kernel and kernel headers
apt-get -y dist-upgrade -o Dpkg::Options::="--force-confnew";

# update package index on boot
cat <<EOF >/etc/init/refresh-apt.conf;
description "update package index"
start on networking
task
exec /usr/bin/apt-get update
EOF
