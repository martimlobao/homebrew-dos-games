# Homebrew Retro Windows and DOS Games

Collection of Homebrew-installable retro Windows and DOS games from my childhood.

## Usage

Tap this repository to install the available games:

```sh
brew tap martimlobao/dos-games
brew install my-game
```

## 🕹 How to create a DOS game as a self-contained macOS app

This guide outlines the process for turning a classic DOS game (e.g. from [ClassicReload](https://classicreload.com)) into a standalone `.app` bundle on macOS using [DOSBox-X](https://dosbox-x.com/).

### Download the Game Files from ClassicReload

ClassicReload games often stream their content dynamically. To retrieve the files:

* Open the game page in your browser.
* Open Developer Tools (`Cmd+Opt+I`) and go to the **Network** tab.
* Press the play button to load the game and filter the network sources by `*.zip`, `.img`, `.iso`, or `.cue`.
* Download the relevant archive files manually (for large `CDROM.zip` files which are streamed, use the `download_cdrom.py` script).
* Also locate and download the game's **metadata XML file**, which may describe how drives are mounted, what the entrypoint is, and required config options.

> Tip: The `metadata.xml` file will provide information on which folders are mounted as C:, D:, etc., and what the game's startup command is (e.g., `AUTORUN.BAT`, `INSTALL.EXE`, etc.).

### Set up the `.app` bundle structure

Create a standard macOS `.app` bundle. Depending on the files needed for the game, it should look something like this:

```txt
MyGame.app/
├── Contents/
│   ├── MacOS/
│   │   ├── arm64/
│   │   ├── x86_64/
│   │   ├── dosbox-x
│   │   └── launch.sh
│   ├── Resources/
│   │   ├── CDROM/
│   │   ├── GAMEDATA/      ← initial game data copied here
│   │   ├── win311qt/
│   │   └── icon.icns
│   └── Info.plist
```

* Copy the extracted game files into `Contents/Resources/`.
* Place the `dosbox-x` binary and additional files into `Contents/MacOS/` (either from the official release or a stripped-down build).

### Create `launch.sh`

Based on whatever is defined in the metadata file, modify the `autoexec` steps to mount the appropriate folders as drives and run the game initializer. As an example, this script:

* On first run, copies the bundled game files to `~/Library/Application Support/MyGame/`
* Generates a temporary `.conf` file with correct mount paths
* Launches DOSBox-X

```bash
#!/bin/bash
NAME="My Game"
APPDIR="$(cd "$(dirname "$0")/.." && pwd)"
RESOURCES="$APPDIR/Resources"
GAMEDATA="$HOME/Library/Application Support/$NAME"
CONF_TMP="/tmp/dosbox_x_conf_$$.conf"

mkdir -p "$GAMEDATA"

if [ ! -f "$GAMEDATA/AUTORUN.BAT" ]; then
  cp -R "$RESOURCES/GAMEDATA/"* "$GAMEDATA/"
fi

cat > "$CONF_TMP" <<EOF
[sdl]
autolock=true
output=opengl

[dosbox]
title=$NAME
memsize=32

[autoexec]
MOUNT C "$GAMEDATA"
MOUNT D "$RESOURCES/win311qt"
MOUNT E "$RESOURCES/CDROM"
C:
AUTORUN.BAT
EOF

"$APPDIR/MacOS/dosbox-x" -conf "$CONF_TMP"
```

Make sure it's executable:

```bash
chmod +x MyGame.app/Contents/MacOS/launch.sh
```

### Create the app icon

1. Find CD or box art for the game.

2. Open [Photopea](https://photopea.com/) or another image editor and:

   * Add the image
   * Overlay a glossy reflection (add a Layer Gradient with _Soft Light_ blending mode)
   * Export as PNG

3. Use Apple's [Icon Composer](https://developer.apple.com/icon-composer/) app to generate a base icon which follows Apple's macOS icon design guidelines.

4. Use the `icon.sh` script to generate the `icns` file.

Place `icon.icns` in `Contents/Resources/`.

### Set up `Info.plist`

Create `Contents/Info.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleName</key>
  <string>MyGame</string>
  <key>CFBundleExecutable</key>
  <string>launch.sh</string>
  <key>CFBundleIconFile</key>
  <string>icon.icns</string>
  <key>CFBundleIdentifier</key>
  <string>com.yourname.mygame</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
</dict>
</plist>
```

When updating the app, remember to bump the `CFBundleVersion` number.

### Sign the app

To avoid Gatekeeper issues:

```bash
codesign --force --deep --sign - MyGame.app
```
