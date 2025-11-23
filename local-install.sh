cargo build --release

sudo cp target/release/niri /usr/local/bin/niri-local
sudo cp resources/niri-session-local /usr/local/bin/
sudo cp resources/niri-local.desktop /usr/share/wayland-sessions
sudo cp resources/niri-local.service /lib/systemd/user/

sudo chmod +x /usr/local/bin/niri-local /usr/local/bin/niri-session-local
