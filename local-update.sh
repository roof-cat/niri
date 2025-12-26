#!/bin/sh

cargo build --release

sudo cp -f target/release/niri /usr/local/bin/niri
sudo chmod +x /usr/local/bin/niri

echo "Niri has been updated, restart Niri"
