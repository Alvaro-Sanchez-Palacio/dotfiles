```
 _ __   __ _  ___ _ __ ___   __ _ _ __  
| '_ \ / _` |/ __| '_ ` _ \ / _` | '_ \ 
| |_) | (_| | (__| | | | | | (_| | | | |
| .__/ \__,_|\___|_| |_| |_|\__,_|_| |_|
|_|                                     

```
# Searching for a package :
pacman -Qs <package>
_Replace <package> by the name of the package, ex : `pacman -Qs snapd`_


```
                        _                       _ _____ 
 _ __ ___   __ _ _ __  (_) __ _ _ __ ___       (_)___ / 
| '_ ` _ \ / _` | '_ \ | |/ _` | '__/ _ \ _____| | |_ \ 
| | | | | | (_| | | | || | (_| | | | (_) |_____| |___) |
|_| |_| |_|\__,_|_| |_|/ |\__,_|_|  \___/      |_|____/ 
                     |__/                               
```

# Install audio :
`sudo pamac install pulseaudio-alsa`


# Configure i3 :
nvim .i3/config
_Search @ASA_

# Configure profile :
1. Edit .profile
1. Change editor :
`export EDITOR=/usr/bin/nvim`
1. Change the browser :
`export BROWSER=/usr/bin/brave`

# Configure urxvt :

## Font :
1. Add the TTFs into the folder `/usr/share/fonts/TTF`
1. Add the font into nvim .Xresources:
```
URxvt.font: 			          xft:FiraCode Nerd Font Mono:style=Bold:pixelsize=11
```
1. Reset urxvt to read the font and size:
```
xrdb ~/.Xresources
```
1. Logout and login
_In case of issues, reset the cache : ``_

## Extensions :


## See window information :
1. Execute `xprop`
1. Click on the window to see information

## Configure Icons for workspaces :
1. Downlaod the fonts (.ttf)
_https://github.com/FortAwesome/Font-Awesome/releases_
1. Move them into .local/share/fonts/ (create folder if needed)
1. Modify the workspace name by coping the icon :
`set $ws2 `
1. Include into i3/config : 
`font pango: DejaVu Sans Mono, FontAwesom5Free, FontAwesome5Brands, FontAwesome5Solid 8`

## Configure background :
`nitrogen`

# Install vim-plug :
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# Use spanish layout : 
`setxkbmap`

# If in virtualbox : 
1. Install virtualbox guest editions :
`https://wiki.manjaro.org/index.php?title=VirtualBox#Running_Manjaro_under_VirtualBox`
1. Mount shared folder :
`sudo mount -t vboxsf wsvm ~/Desktop/wsvm/`
_Folder needs to be configured to be existing in the host and
the folder needs to exists both in host and guest_

```
 _                    _          
| |__   ___ _ __ ___ | | ___   _ 
| '_ \ / _ \ '__/ _ \| |/ / | | |
| | | |  __/ | | (_) |   <| |_| |
|_| |_|\___|_|  \___/|_|\_\\__,_|

```

# Spaces :
## List spaces :
`heroku spaces:info -s psatest`


# Apps :
## List apps :
`heroku apps -A`

## Download code :
`heroku git:clone -a <myapp>`
Ex:
`heroku git:clone -a psatest-monitoring-api`
`heroku git:clone -a psatest-monitoring-front`

# Help :
`heroku help <command> [options]`
Ex:
`heroku help apps`




```
 _____ ___  ____   ___  
|_   _/ _ \|  _ \ / _ \ 
  | || | | | | | | | | |
  | || |_| | |_| | |_| |
  |_| \___/|____/ \___/ 
                        
```

# TODO's :
- Add bible icon
- Add activate / de-activate system _noise_
- Add CPU icon (tachometer-alt?)
- Add memory % instead of _used / total_
- Add network icon into speed ()
- Investigate Compton
- Add Spotify  (spotify)
- Add FontAwesome into terminal font 


```
  __ _       _      _   
 / _(_) __ _| | ___| |_ 
| |_| |/ _` | |/ _ \ __|
|  _| | (_| | |  __/ |_ 
|_| |_|\__, |_|\___|\__|
       |___/            
```
# Install figlet :
`sudo pacman -S figlet`

# Create a Figlet :
`figlet <test>`
