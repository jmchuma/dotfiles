## Some colors, because I like to have fun sometimes.
LIGHT_GREEN='\033[1;32;4m'
RESET_COLOR='\e[0m'

# To test some programs
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" sudo apt install flatpak
sudo apt install flatpak

# Configure Flatpak.
# Add Flathub as a repository.
printf "flatpak -u remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
flatpak -u remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Nyxt web browser via Flatpak.
printf "$UNDERLINE%s %s %s $LIGHT_GREEN%s$RESET_COLOR\n" flatpak install flathub engineer.atlas.Nyxt
flatpak install flathub engineer.atlas.Nyxt
