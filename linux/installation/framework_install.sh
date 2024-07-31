# This is a log of the commands I run after installing debian on my
# AMD Framework Laptop.

# Some colors, because I like to have fun sometimes.
LIGHT_GREEN='\033[1;32;4m'
RESET_COLOR='\e[0m'


# On installation do not, I repeat DO NOT set a root password.
# This prevents the creation of a root account.

# Partition setup:
# - EFI    550MiB
#     + bootable partition
# - /boot  500MiB
# - /       50GiB
#     + will contain a swapfile
# - /var    16GiB
# - /tmp     5GiB
# - /home  :whatever is left:


# -1.
# =========================
#
# ADD USER TO SUDOERS
# -------------------------
# If you set a root password during installation, Debian creates a root
# user and doesn't add the regular user to sudoers. As a matter of fact,
# it doesn't even install sudo. Since I don't want to log in as root
# everytime I need a minor change…

# Log in as root and activate no clobber. We want to avoid accidents!
set -o noclobber
# TODO have a ~/bashrc for root and save it at this point?

# Install sudo
apt install sudo
# Add user to the sudoers group.
# TODO Read currrent username.
#      Given a user name, check if it exists.
usermod -aG sudo [username]

# Log out from root and log in to regular user.

# GET FONT FOR TTY
# -------------------------
# Activate no clobber as regular user. We want to avoid accidents!
set -o noclobber

# Change the tty font.
# I'll mostly be on X or Wayland. This is just in case something goes
# south and I'm stuck on the tty for a while.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install fonts-terminus
sudo apt install fonts-terminus

printf "$UNDERLINE%s $LIGHT_GREEN%s %s$RESET_COLOR\n" sudo dpkg-reconfigure console-setup
sudo dpkg-reconfigure console-setup
# Choices: UTF-8  -->  Latin1 & Latin15  -->  TerminusBold  -->  14x28

# ADD SWAP FILE
# -----------------------------
# Create swap file
# In this case 8GiB since I have a lot of RAM and a lof of HD space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=8388608

# Set the permissions so only root can read and write.
# This keeps unprivileged users and processes from tampering
# with it.
sudo chmod 600 /swapfile

# Format the thing as swap.
sudo mkswap /swapfile

# Mount swap file.
sudo swapon /swapfile

# add swap file info to /etc/fstp to load it automatically
# on boot
sudo echo "/swapfile        none        swap        sw        0        0" >> /etc/fstab

# TODO add the swapiness thing here


# 0. INSTALL PACKAGES
# ====================
# Update system.
sudo apt update
sudo apt upgrade

# Get git
# --------------------
# I always have Git on my computers, but right now I need it to get
# the rest of the config files from Github.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install git
sudo apt install git
# TODO
#     - see how to continue from here
#     - should this be in an easily accessible URL so I can get it
#       and run it to complete the a full configuration?

# SYSTEM TOOLS ESSENTIALS
# -------------------
# network-manager for obvious reasons
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install network-manager
sudo apt install network-manager

# USEFUL COMMANDS
# -------------------
# Probably already installed.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install wget
sudo apt install wget

# I always end up having to install it because of a random script.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install curl
sudo apt install curl

# CLI APPLICATIONS
# -------------------
# trash-cli: I know rm -i exists but I prefer to trash files.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install trash-cli
sudo apt install trash-cli
# vim: Nothing personal against vim.tiny.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install vim
sudo apt install vim

printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install yt-dlp
sudo apt install yt-dlp # I use it indepdently of mpv

# Xorg
# -------------------
# I thought about doing the full installation like
# sudo apt install xorg
# but I decided to go minimal and just install the amdgpu driver.
# This also pulls xserver-xorg-core.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install xserver-xorg-video-amdgpu
sudo apt install xserver-xorg-video-amdgpu
# Install xinit
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install xinit
sudo apt install xinit

# Window manager
# i3 is a meta pacakge. The actual functionality is provided by i3-wm
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install i3-wm
sudo apt install i3-wm
# depends on
#    i3status # TODO get into this one
# recomends TODO are these worth it?
#    xfonts-base # already installed
#    fonts-dejavu-core # already installed

# i3-wm recommends
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

# I do not really use it directly, but it provides import, which I use
# in i3 to take screenshots.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" ssudo apt install imagemagick
sudo apt install imagemagick

# rofi: app launcher
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install rofi
sudo apt install rofi

# ranger: text based file manager
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install ranger
sudo apt install ranger
# sugests mupdf-tools. Will install with mupdf

# ranger suggests: w3m, a www pager.
# Used by ranger to display images on its interface.
# May already be installed
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install w3m
sudo apt install w3m

## my usual suspects
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install ffmpeg
sudo apt install ffmpeg

printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install mpv
sudo apt install mpv
# mpv recommends:
# yt-dlp (previously installed by me in the terminal tools section)
# xdg-utils
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install xdg-utils
sudo apt install xdg-utils # i think i need it anyway. TODO further explore what it does

# Image viewer
# I launch it too from ranger too.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install feh
sudo apt install feh

# PDF viewer
# I use it to open pdf files directly from ranger too.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install mupdf
sudo apt install mupdf
# Suggests: mupdf-tools
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install mupdf-tools
sudo apt install mupdf-tools
