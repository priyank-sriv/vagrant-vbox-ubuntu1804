#!/bin/bash

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-'$VAGRANT_HOME_DIR'}";

VER="`cat /home/vagrant/.vbox_version`";
ISO="VBoxGuestAdditions_$VER.iso";

mkdir -p /tmp/vbox;
mount -o loop $HOME_DIR/$ISO /tmp/vbox;

sh /tmp/vbox/VBoxLinuxAdditions.run
