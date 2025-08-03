# Homebrew Retro Windows and DOS Games

Collection of Homebrew-installable retro Windows and DOS games from my childhood.

## ⬇️ Installation

You can download the zipped games from the [Releases](https://github.com/martimlobao/homebrew-dos-games/releases) section of this repo. Alternatively, you can use [Homebrew](https://brew.sh/) to install each game via the command line. You can install it with the following command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

And then tap this repository to install the available games:

```sh
brew tap martimlobao/dos-games
brew install --cask jumpstart-1st-grade
brew install --cask jumpstart-kindergarten
brew install --cask mission-think
brew install --cask ods-vol1
brew install --cask orlys-draw-a-story
brew install --cask ready-to-read-with-pooh
```

Note that when running these games for the first time, macOS will complain that it was not able to verify the app is free of malware because it was not compiled by an "identified developer" (i.e. me). To open the app anyway, click "Done" on the popup, and then open System Settings, open the _Privacy & Security_ tab, scroll to the bottom of the page to the _Security_ section and click on the "Open Anyway" button next to the message saying the app was blocked. Alternatively, you can install the app with the [`--no-quarantine` flag](https://docs.brew.sh/FAQ#why-cant-i-open-a-mac-app-from-an-unidentified-developer) to bypass this initial check (e.g. `brew install --cask --no-quarantine my-app`).

![Unidentified developer warning](/static/unidentified-developer-warning.png)

## 👾 Available games

### JumpStart 1st Grade

JumpStart 1st Grade is a PC game created by Knowledge Adventure in 1995 intended to teach a first grade curriculum. It was the first appearance of Frankie, a brown, anthropomorphic dachshund dog who would go on to become the mascot of the JumpStart series.

**[📥 Download JumpStart 1st Grade](https://github.com/martimlobao/homebrew-dos-games/releases/download/jumpstart-1st-grade-v1.0.0/jumpstart-1st-grade.app.zip)**

![JumpStart 1st Grade](/static/jumpstart-1st-grade.png)

### JumpStart Kindergarten

JumpStart Kindergarten is an educational video game developed by Fanfare Software and released by Knowledge Adventure on the MS-DOS platform in 1994. It was the first product released in the JumpStart series and is intended to teach kindergarten students. According to the Knowledge Adventure founder Bill Gross, it is the first educational software program that covers the entire kindergarten curriculum.

**[📥 Download JumpStart Kindergarten](https://github.com/martimlobao/homebrew-dos-games/releases/download/jumpstart-kindergarten-v1.0.0/jumpstart-kindergarten.app.zip)**

![JumpStart Kindergarten](/static/jumpstart-kindergarten.png)

<!-- markdownlint-disable MD026 -->
### Mission T.H.I.N.K.
<!-- markdownlint-enable MD026 -->

Mission T.H.I.N.K. (Thinking Hard Inspires New Knowledge) is the final addition to the Super Solvers series created by The Learning Company. Morty Maxwell tries to take over the Shady Glen Game Factory with help of the Metal Minions. The game cultivates critical thinking skills by encouraging players to solve puzzles and create strategies. The original score in the five levels is by the famous fusion ensemble Yellowjackets.

**[📥 Download Mission T.H.I.N.K.](https://github.com/martimlobao/homebrew-dos-games/releases/download/mission-think-v1.0.0/mission-think.app.zip)**

> [!NOTE]
On first launch, the app will always crash with a general protection fault error with SSMWIN16. Click "Close" on the dialog and then "Close" again, and relaunch the program within Windows and it will run normally the second time.

![Mission T.H.I.N.K.](/static/mission-think.png)

### Ohio Distinctive Software Vol. I

Ohio Distinctive Software Vol. I is a 1997 teacher's edition compilation containing four educational games from Ohio Distinctive Software, a company founded in 1987 that specialized in children's educational software. The collection features the robotic character Blit, with his distinctive green and yellow antennae, across four separate games: ODS Carnival Math, ODS Air Explorer, ODS Robot Challenge, and ODS Amazing Art Corner. This compilation was designed to provide teachers with multiple educational activities that would have otherwise been distributed as individual CD-ROMs. While relatively unknown compared to other educational games of the era, this title has been preserved and made available by the [Internet Archive](https://archive.org/details/ohio-distinctive-software-vol-1).

**[📥 Download Ohio Distinctive Software Vol. I](https://github.com/martimlobao/homebrew-dos-games/releases/download/ods-vol1-v1.0.0/ods-vol1.app.zip)**

![Ohio Distinctive Software Vol. I](/static/ods-vol1.png)

### Orly's Draw-A-Story

Orly's Draw a Story is a video game released in 1997 by Broderbund aimed at children from 5 to 10. It focuses around the two main characters, Orly, an 8-year-old girl and her anthropomorphic talking frog friend Lancelot who lives in Jamaica. The game features four unique stories narrated by Orly. The player is able to illustrate each of the stories with their own paintings, either original drawings or using ready-prepared objects. As Orly tells the story, the user is asked to create an item such as a friend for a flying monster or a birthday present to give to Orly.

**[📥 Download Orly's Draw-A-Story](https://github.com/martimlobao/homebrew-dos-games/releases/download/ods-vol1-v1.0.0/orlys-draw-a-story.app.zip)**

![Orly's Draw-A-Story](/static/orlys-draw-a-story.png)

### Ready to Read with Pooh

Ready to Read with Pooh is a 1997 interactive CD-ROM video game developed by Disney Interactive's Victoria studio that helps children from ages three to six learn to read. There are nine activities in the game. When the player completes an activity successfully, they will receive an item that goes into a treehouse.

**[📥 Download Ready to Read with Pooh](https://github.com/martimlobao/homebrew-dos-games/releases/download/ready-to-read-with-pooh-v1.0.2/ready-to-read-with-pooh.app.zip)**

![Ready to Read with Pooh](/static/ready-to-read-with-pooh.png)

## 🕹 How to create a DOS game as a self-contained macOS app

This guide outlines the process for turning a classic DOS game (e.g. from [ClassicReload](https://classicreload.com)) into a standalone `.app` bundle on macOS using [DOSBox-X](https://dosbox-x.com/). These instructions are mostly provided for my own benefit, but they should help anyone trying to compile a standalone Mac app for themselves.

### Download the Game Files from ClassicReload

ClassicReload games often stream their content dynamically. To retrieve the files:

* Open the game page in your browser.
* Open Developer Tools (`Cmd+Opt+I`) and go to the **Network** tab.
* Press the play button to load the game and filter the network sources by `*.zip`, `.img`, `.iso`, or `.cue`.
* Download the relevant archive files manually (for large `CDROM.zip` files which are streamed, use the `download_cdrom.py` script).
* Also locate and download the game's **metadata XML file**, which may describe how drives are mounted, what the entrypoint is, and required config options.

> [!IMPORTANT]
The `metadata.xml` file will provide information on which folders are mounted as C:, D:, etc., and what the game's startup command is (e.g., `AUTORUN.BAT`, `INSTALL.EXE`, etc.).
<!-- markdownlint-disable MD028 --><!-- markdownlint-enable MD028 -->
> [!TIP]
It is also possible to install games which are not available on ClassicReload. Doing so usually requires a `.cue` and `.bin` file, followed by mounting the virtual CD drive and installing the game to disk using something like `IMGMOUNT E GAME.cue -t iso -fs iso`. To have the game start automatically, create a `WINSTART.BAT` file such as [the one using for ODS Vol I](/games/ods-vol1/Ohio%20Distinctive%20Software%20Vol.%20I.app/Contents/Resources/GAMEDATA/windows/WINSTART.BAT).

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

## 🚀 Creating a release

To create a new game release:

1. Add the working `.app` to the `games/` directory, create a PR, and merge it.
    > [!IMPORTANT]
    Ensure that you have run the `codesign` command above to sign the app bundle after making any changes.
2. On the `main` branch, create a new release tag:

    ```sh
    git tag my-game-v1.0.0
    git push origin my-game-v1.0.0
    ```

3. Get the SHA256 hash from the new [release](https://github.com/martimlobao/homebrew-dos-games/releases).
4. Update the `.rb` script in `Casks/` with the new hash and version number.
