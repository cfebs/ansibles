# ansibles

ansible configs for my own machines

## Usage

```
./run
```

## Layout

Each machine has a playbook named after hostname.

The playbook hostname should match an entry in `hosts.ini`.

A Makefile task then runs the playbook as a oneoff for the host. Ex.

```
.PHONY: tennislhua
tennislhua:
	ansible-playbook -i hosts.ini tennislhua.yml --limit tennislhua --ask-become-pass
```

## Roles

- `arch-common`: sets up arch linux across different host types, should be runnable right after
the chroot step into a new install
    - Set `hostname_init` in playbook file for the host.
- `dots`: links dot files
- `pacman`: installs common base pkgs
- `arch-i3-desktop`: installs an i3 "desktop environment"
- `arch-laptop`: installs laptop specific tools
