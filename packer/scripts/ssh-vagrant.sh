#!/bin/bash -eux

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-'$VAGRANT_HOME_DIR'}";

mkdir -p $HOME_DIR/.ssh;

if [ -f "$VAGRANT_SSH_PUB" ] then
  cp $VAGRANT_SSH_PUB $HOME_DIR/.ssh/authorized_keys
else
  echo "No public key found: '$VAGRANT_SSH_PUB'";
  exit 1;
fi
chown -R vagrant $HOME_DIR/.ssh;
chmod -R go-rwsx $HOME_DIR/.ssh;
