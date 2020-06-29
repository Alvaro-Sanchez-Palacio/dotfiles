```
 _ __   __ _  ___ _ __ ___   __ _ _ __  
| '_ \ / _  |/ __| '_   _ \ / _  | '_ \ 
| |_) | (_| | (__| | | | | | (_| | | | |
| .__/ \__,_|\___|_| |_| |_|\__,_|_| |_|
|_|                                     

```
# Searching for a package :
pacman -Qs <package>
_Replace <package> by the name of the package, ex : `pacman -Qs snapd`_

# Proxy :
1. Edit _environment_ file : `sudo nvim /etc/environment`
1. Add proxy values :
```bash
http_proxy=http://<user>:<password>@<proxy>:<port>/
https_proxy=http://<user>:<password>@<proxy>:<port>/
```
1. Edit _profile.d/http_proxy_
`$ sudo nvim /etc/profile.d/http_proxy.sh`

```
export http_proxy="http://<user>:<password>@<proxy>:<port>"
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
```

## Github :
Two options :
1. Modify via code :
`git config --global http.proxy http://<user>:<password>@<proxy>:<port>`
2. Edit ~/.gitconfig:
```
[user]
	username = alvarosanchezpalacio
	name = Alvaro Sanchez Palacio
	mail = alvaro.sanchez@mpsa.com
	email = alvaro.sanchez@mpsa.com
[http]
	proxy = http://<user>:<password>@<proxy>:<port>
```

## Pipenv :
Prior to starting the virtual environment (pipenv shell), configure proxy:
`export http_proxy="http://<user>:<password>@<proxy>:<port>"`
`export https_proxy="http://<user>:<password>@<proxy>:<port>"`

Install neovim & pylint into virtual environment:
`pipenv install pylint neovim -d`

```
                        _                       _ _____ 
 _ __ ___   __ _ _ __  (_) __ _ _ __ ___       (_)___ / 
|  _   _ \ / _  |  _ \ | |/ _\ |  __/ _ \ _____| | |_ \ 
| | | | | | (_| | | | || | (_| | | | (_) |_____| |___) |
|_| |_| |_|\__,_|_| |_|/ |\__,_|_|  \___/      |_|____/ 
                     |__/                               
```

# Install linux headers (for virtualbox) :
1. Find your kernel version :
`uname -r`
1. Install linux headers :
Depending on the version of Kernel :
If the version is 5.4
`sudo pacman -S linux54-headers`
If the version is 4.20
`sudo pacman -S linux420-headers`
1. Install make, pearl & gcc (from package manager, for example)
1. Click on "Devices > Insert Guest Adittions CD image ..."
_This should add the VBox media device_
1. Run autorun.sh from VBoxGuest
`$ sudo gpasswd -a $USER vboxsf`
1. Change ownership of /media
`sudo chown root:vboxsf /media`

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

## |- Font :
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
_In case of issues, reset the cache : `fc-cache -f -v`_

# Configure .bashrc :
## Alias :
1. Add the aliases in the list :

alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'

## |- Extensions :

## |- See window information :
1. Execute `xprop`
1. Click on the window to see information

## |- Configure Icons for workspaces :
1. Downlaod the fonts (.ttf)
_https://github.com/FortAwesome/Font-Awesome/releases_
1. Move them into .local/share/fonts/ (create folder if needed)
1. Modify the workspace name by coping the icon :
`set $ws2 `
1. Include into i3/config : 
`font pango: DejaVu Sans Mono, FontAwesom5Free, FontAwesome5Brands, FontAwesome5Solid 8`

## |- Configure background :
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

# Notifications system (Dunst)
Restart : META+SHIFT+D

```
 _                    _          
| |__   ___ _ __ ___ | | ___   _ 
| '_ \ / _ \ '__/ _ \| |/ / | | |
| | | |  __/ | | (_) |   <| |_| |
|_| |_|\___|_|  \___/|_|\_\\__,_|

```

# - Spaces :

## |- List spaces :
`heroku spaces:info -s psatest`


# - Apps :

## |- List apps :
`heroku apps -A`

_Space can be specified using -s <space>_

## |- Download code :
`heroku git:clone -a <myapp>`
Ex:
`heroku git:clone -a psatest-monitoring-api`
`heroku git:clone -a psatest-monitoring-front`

# - Audit :

## |- List :
`heroku audit-trail -e my-enterprise-account-name`

_See : https://devcenter.heroku.com/articles/audit-trail_


# - Pipelines :

## |- Create :

```
USAGE
  $ heroku pipelines:create [NAME]

ARGUMENTS
  NAME  name of pipeline (defaults to basename of the app)

OPTIONS
  -a, --app=app        (required) app to run command against
  -r, --remote=remote  git remote of app to use
  -s, --stage=stage    stage of first app in pipeline
  -t, --team=team      the team which will own the apps

DESCRIPTION
  An existing app must be specified as the first app in the pipeline.
     The pipeline name will be inferred from the app name if not specified.
     The stage of the app will be guessed based on its name if not specified.
     The pipeline owner will be the user creating the pipeline if not specified with -t 
  for teams or -o for orgs.

EXAMPLES
  $ heroku pipelines:create -a my-app-staging
  $ heroku pipelines:create my-pipeline -a my-app-staging
```

# - Help :
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
            _           
 _ ____   _(_)_ __ ___  
| '_ \ \ / / | '_   _ \ 
| | | \ V /| | | | | | |
|_| |_|\_/ |_|_| |_| |_|
                        
```

# Format
- JSON : `:%!python -m json.tool`

# Scroll

## Sync scroll between tabs:
In each window that should scroll simultaneously, enter the command:
`:set scrollbind`
To apply the sync to all open windows:
`:windo set scrollbind`

# Diff
## Compare active windows:
Execute `:windo diffthis` to compare all active windows
Execute `:diffoff` or `:diffoff!` to close diff

```
  __ _       _      _   
 / _(_) __ _| | ___| |_ 
| |_| |/ _  | |/ _ \ __|
|  _| | (_| | |  __/ |_ 
|_| |_|\__, |_|\___|\__|
       |___/            
```
# Install figlet :
`sudo pacman -S figlet`

# Create a Figlet :
`figlet <test>`
