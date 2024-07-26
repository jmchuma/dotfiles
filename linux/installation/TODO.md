Since I use NetworkManager, check:
- nmcli: installed by newtwork-manager
- network-manager-gnome
- Also check
    - nmtui
    - wpa_cli
    - wicd
    - wicd-cli
    - wicd-curses
    - connman-ui
    - iwd
    - netctl
    - nwetwork manager vs iwd vs wpa_supplicant


Display manager
(d) depends
(r) recommends
(s) suggests
not really needed but
- lightdm
  (s) accountservice
  (s) upower [r polkitd]

- lightdm-settings
  (d) slick-greeter [d lightdm]  # not installed
  (d) pkexec                     # already installed because of

Maybe not necessary since lightdm brings dm-tool with locking
capabilites
? light-locker # if yes remove i3lock

? lightdm-gtk-greeter
   (r) desktop-base         # already installed because of
   (r) adawaita-icon-theme  # not installed
   (r) policykit-1          # already installed because of

? lightdm-gtk-greeter-settings [d lightdm-gtk-greeter]
   (r) pkexec [d in lightdm-settings] # already installed because of
   (r) polkitd                        # already installed because of

? slick-greeter [d lightdm]

? desktop-base    # already installed because of

? plymouth        # already installed because of
