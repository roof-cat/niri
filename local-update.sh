#!/bin/sh

cargo build --release

sudo cp -f target/release/niri /usr/local/bin/niri-local
sudo chmod +x /usr/local/bin/niri-local

echo "Niri has been updated, restart Niri"
