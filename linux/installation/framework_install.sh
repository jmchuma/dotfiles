# This is a log of the commands I run after installing debian on my
# AMD Framework Laptop

## Some colors, because I like to have fun sometimes.
LIGHT_GREEN='\033[1;32;4m'
RESET_COLOR='\e[0m'


# 0. ADD USER TO SUDOERS
# ==========================
# If you set a root password during installation Debian doesn't add
# the regular user to sudoers. As a matter of fact id doesn't even
# install sudo. Since I don't want to log in as root everytime I need
# a minor change...

# Log in as root and
# activate no clobber option explicitly. We want to avoid accidents!
set -o noclobber
# TODO have a ~/bashrc for root and save it at this point?

# Install sudo
apt install sudo
# Add user to the sudoers grfoup
# TODO read username
#      check if exists
usermod -aG sudo [username]

# logout from root
# log in to regular user


# 2. SWAP
# ==============
# Create swap file
# In this case 8GiB since I have a lot of RAM and a lof of HD space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=8388608

# Set the permissions so only root can read and write.
# This keeps unprivileged users and processes from tampering
# with it.
sudo chmod 600 /swapfile

# format the thing as swap
sudo mkswap /swapfile

# mount swap file
sudo swapon /swapfile

# add swap file info to /etc/fstp to load it automatically
# on boot
sudo echo "/swapfile        none        swap        sw        0        0" >> /etc/fstab

# TODO add the swapiness thing here

# 3. SOFTWARE
# ====================
# Update packages
sudo apt update
sudo apt upgrade

# Get the basics
# ----------------
# network-manager for obvious reasons
# vim: Nothing personal against vim.tiny. 
# trash-cli: I know rm -i exists but I prefer to trash files
# git: to use git in general, but right now to the the rest from Github.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s %s %s %s$RESET_COLOR\n" sudo apt install network-manager vim trash-cli git
sudo apt install network-manager vim trash-cli git
# TODO move trash-cli and vim to another place
# git goes here, then git checkout, then run script


## X Windows
# I thought about doing the full installation like
# sudo apt install xorg
# but I decided to go minimal and just
# install amdgpu driver. This also pull xserver-xorg-core
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install xserver-xorg-video-amdgpu
sudo apt install xserver-xorg-video-amdgpu
# Install xinit
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install i3lock
sudo apt install xinit

## i3 stuff
# i3 is a meta pacakge. The actual functionality is provided by i3-wm
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install i3-wm
sudo apt install i3-wm
# depends on
#    i3status # TODO get insto this one
# recomends TODO are these worth it?
# xfonts-base fonts-dejavu-core

# i3 recommends
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install i3lock
sudo apt install i3lock # TODO configure i3lock
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install dunst
sudo apt install dunst # TODO configure dunst

# i3blocks # TODO see if I really need it
# recomends
# acpi
# gawk
# alsa-utils (suggest dialog)
# sysstat ()

# 
# provides import
# used in i3 to take screenshots
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" ssudo apt install imagemagick
sudo apt install imagemagick

## rofi
# app launcher
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install rofi
sudo apt install rofi

## ranger
# text based file manager
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install ranger
sudo apt install ranger
# sugests mupdf-tools. Will install with mupdf

# suggests w3m, a www pager.
# used by ranger to display images on its interface
# may already be installed
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install w3m
sudo apt install w3m


## my usual suspects
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install ffmpeg
sudo apt install ffmpeg

printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install mpv
sudo apt install mpv
# mpv recommends:
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install xdg-utils
sudo apt install xdg-utils # i think i need it anyway. TODO further explore what it does
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install yt-dlp
sudo apt install yt-dlp # i use it indepdently of mpv

# image viewer
# I launch it too from ranger use it to view images too.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install feh
sudo apt install feh

## pdf viewwer
# I use it to open pdf foiles directly from ranger too.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN %s $RESET_COLOR\n" sudo apt install mupdf
sudo apt install mupdf
# Suggests: mupdf-tools
printf "$UNDERLINE%s %s %s $LIGHT_GREEN %s $RESET_COLOR\n" sudo apt install mupdf-tools
sudo apt install mupdf-tools

## console stuff I use

#probably already installed
printf "$UNDERLINE%s %s %s $LIGHT_GREEN %s $RESET_COLOR\n" sudo apt install wget
sudo apt install wget

# I always end up having to install it because of a random script
printf "$UNDERLINE%s %s %s $LIGHT_GREEN %s $RESET_COLOR\n" sudo apt install curl
sudo apt install curl 
