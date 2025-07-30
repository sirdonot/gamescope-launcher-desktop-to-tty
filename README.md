# Gamescope launcher desktop to tty

Launches a video as overlay, wait 14 seconds, then changes to the desired TTY session.

### Instructions

First, you need to install the dependencies:

[mpv](https://github.com/mpv-player/mpv).
[wlroots](https://gitlab.freedesktop.org/wlroots/wlroots).

#### 1. Setting up a custom gamescope-session

I wont be showing how to do it, but the [steam-using-gamescope-guide](https://github.com/shahnawazshahin/steam-using-gamescope-guide.git). have a detailed step by step guide on how to set it up.

Also the [Steam-Gamemode](https://gist.github.com/Rishikant181/e26fb23d4c57db74bddaa0a57b26cd26). guide to auto start the [Gamescope](https://github.com/ValveSoftware/gamescope) once you switch to the desired TTY session.


#### 2. Installing mpvpaper

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

##### Using a package manager:

For this example, arch will be used to install mpvpaper.

*Assuming you have your favorite aur helper*
* On Arch-based distribution:

```bash
  yay -S mpvpaper
```

#### 3. Setting up

Now that you installed everything needed, we just need to set it up.

The main script:
```bash
#!/usr/bin/env bash

## Makes sure steam is not running
if pidof -x steam >/dev/null; then
  steam -shutdown
fi

## Set the password and tty
PASSWORD=*user password*
TTY=*tty number*

## Sets the password and changes to the used TTY
echo "$PASSWORD" | sudo -S sleep 14 && chvt $TTY &

## Optional
## Hides the mouse in hyprland using hyprctl
default=$(hyprctl getoption cursor:inactive_timeout | awk '{print $NF}')
hyprctl keyword cursor:inactive_timeout 0.0001 &
sleep 14 && hyprctl keyword cursor:inactive_timeout "$default" &

## Intro video file name
FILENAME=gamescope.mp4

SCRIPT_DIR=${BASH_SOURCE%/*}
INTRO="$SCRIPT_DIR/$FILENAME"

## Starts the intro
mpvpaper --layer overlay ALL $INTRO
```


You need to set your sudo password to switch to another tty via terminal.
```bash
PASSWORD=*user password*
```

Here you just need set the desired tty number, like 1 or 2(not recommended if you have a display manager), 3, 4, 5, etc.
```bash
TTY=*tty number*
```
