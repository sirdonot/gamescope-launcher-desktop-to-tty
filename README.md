# Gamescope launcher desktop to tty

Launches a video as overlay, wait 14 seconds, then changes to the desired TTY session.

### Instructions

#### 1. Install mpvpaper

##### Clone | Build | Install:

 ```bash
# Clone
git clone --single-branch https://github.com/GhostNaN/mpvpaper
# Build
cd mpvpaper
meson setup build --prefix=/usr/local
ninja -C build
# Install
ninja -C build install
  ```

##### Using a package manager

For this example, arch will be used to install mpvpaper.

*Assuming you have your favorite aur helper*
* On Arch-based distribution:

  ```bash
  yay -S mpvpaper
  ```

