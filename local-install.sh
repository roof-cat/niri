#sudo pacman -S clang

cargo build --release

sudo cp -f target/release/niri /usr/local/bin/niri
sudo cp resources/niri-session /usr/local/bin/niri-session
sudo cp resources/niri.desktop /usr/share/wayland-sessions
sudo cp resources/niri.service /lib/systemd/user/

sudo chmod +x /usr/local/bin/niri /usr/local/bin/niri-session
