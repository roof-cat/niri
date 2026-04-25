#!/bin/sh
#sudo pacman -S clang

set -e

cargo build --release

sudo cp -f target/release/niri /usr/bin/niri
sudo cp resources/niri-session /usr/local/bin/niri-session
sudo cp resources/niri.desktop /usr/share/wayland-sessions/
sudo cp resources/niri.service /usr/lib/systemd/user/

sudo chmod +x /usr/bin/niri /usr/local/bin/niri-session

echo "Niri installed, restart Niri"
