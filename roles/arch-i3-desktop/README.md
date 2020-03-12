## arch-i3-desktop

Installs basics to run i3 desktop (includes things like NetworkManager).

### Arch Notes

> Notes from my manual installs that influenced decisions.

- To fix startx race condition, early driver KMS defined in /etc/mkinitcpio.conf. Might need to change if using different driver.
    - requires `mkinitcpio -P` after change

- Noto emoji
    - See `home/.config/fontconfig/fonts.conf` idea is to always prepend noto for common families and then include noto emoji in the fallback list
    - Fontmanager gui creates blacklists in `~/.config/` ! I blacklisted color emoji font when I was testing

- To fix dns resolution in office needed `DNSSEC=no` in `/etc/systemd/resolved.conf`

- To fix ethernet dhcp4 failing install `dhclient` and add NetworkManager config here: https://wiki.archlinux.org/index.php/NetworkManager#DHCP_client

