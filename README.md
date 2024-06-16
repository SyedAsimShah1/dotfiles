# Steps
Steps to replicate home machine setup (WSL2 with Ubuntu 24 LTS):

## Clone this repo
```git clone https://github.com/SyedAsimShah1/dotfiles.git ```

## Remap CAPSLOCK to CTRL and ESC
### Option 1:
Watch this video https://www.youtube.com/watch?v=fSfuHspXy5s

### Option 2:
 1. Install [AutoHotkey](https://www.autohotkey.com/)
 2. Download the script on https://gist.github.com/sedm0784/4443120 and compile it (will need to install the Ahk2Exe from the AutoHotKey Gui (select the v1xxx base file and hit Save in Ahk2Exe)).
 3. Place resulting exe in "\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\


## Instal Tools, Deps and Make Symbolic Links
Run the ./setupEnv.sh script and follow its instructions.

