#!/bin/bash

set -e

video_gid=`find /dev/dri -type c | xargs -r stat -c '%g' | uniq`
[[ "$video_gid" =~ ^[1-9][0-9]+$ ]]

echo "setting gid of video to $video_gid"
groupmod -g "$video_gid" video

[[ -n "$USER" && -d "$HOME" && -x "$SHELL" ]]

IFS=: read uid gid <<< `stat -c '%u:%g' $HOME`

echo "creating user $USER"
groupadd -g "$gid" "$USER"
useradd -u "$uid" -g "$USER" -G video -M -d "$HOME" -s "$SHELL" "$USER"

cat >/etc/sudoers.d/jderobot-dev <<EOF
Defaults env_keep += SSH_AUTH_SOCK
$USER ALL = (ALL) NOPASSWD: ALL
EOF

echo DOCKER > /etc/debian_chroot

exec sudo -E -u "$USER" -i
