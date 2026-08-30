# dotfiles
My dotfiles: i3wm, Vim, tmux, zsh, termite.

# [Stow](http://www.gnu.org/software/stow/)
Stow is a symlink farm manager program which takes distinct sets of software and/or data located in separate directories on the filesystem, and makes them all appear to be installed in a single directory tree.

Arch Linux:
```bash
yay -Sy stow
```

I  use stow to have all dotfiles on ~/.dotfiles under version control git.

# Cloning the repo
I recommend to clone the repo on ~/.dofiles directory

```bash
git clone git@github.com:Sergi030/dotfiles.git .dotfiles
```
## I3

1. Install I3 and dependencies
```bash
yay -Sy i3-gaps i3blocks pavucontrol ttf-font-awesome ttf-font-awesome-4 alsa-utils flameshot rofi playerctl
```


## VIM

1. Install vim

```bash
yay -Sy vim
```

2. Install [Vundle](https://github.com/VundleVim/Vundle.vim.git):

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

3. Stow VIM config

```bash
cd ~/.dotfiles && stow VIM && cd -
```

4. Install Vundle PLugins

```bash
vim +PluginInstall +qall
```

5. Install last requierements

```bash
# Install ctags, cmake
yay -Sy ctags cmake

# Complete the installation of YouCompleteMe
cd .vim/bundle/YouCompleteMe/ && ./install.py --all && cd -

```
## Termite

1. Install termite

```bash
yay -Sy termite
```

2. Install requiered [Fonts](https://github.com/powerline/fonts):

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

3. Stow termite

```bash
cd ~/.dotfiles && stow TERMITE && cd -
```

## ZSH
1. Install [ZSH](https://www.zsh.org/)

```bash
yay -Sy zsh
```

2. Install [ohmyzsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Stow ZSH

```bash
rm ~/.zshrc && cd ~/.dotfiles && stow ZSH && cd -
```

4. Make ZSH the default shell
```
chsh -s /bin/zsh
```

## TMUX
My Tmux configuration is from [gpakosz](https://github.com/gpakosz/.tmux)

1. Install [tmux](https://github.com/tmux/tmux)

```bash
yay -Sy tmux
```

2. Stow TMUX

```bash
cd ~/.dotfiles && stow TMUX && cd -
```


## Hyprland

1. Install Hyprland and the session programs

```bash
sudo apt install -y hyprland waybar swww wl-clipboard cliphist hypridle hyprlock kanshi dunst rofi brightnessctl
```

2. Stow Hypr

`~/.config/systemd/user` must exist first, otherwise stow folds the whole
`systemd` tree into a symlink and no other unit can ever be added to it.

```bash
mkdir -p ~/.config/systemd/user
cd ~/.dotfiles && stow Hypr && cd -
```

3. Enable the session services

The session is run by systemd, not by `exec-once`. `hyprland.conf` starts a single
unit, `hyprland-session.target`, which pulls in `graphical-session.target`; every
service below hangs off that and is restarted automatically if it dies. Stow only
symlinks the unit files — enabling them is separate state, so do it once per machine:

```bash
systemctl --user daemon-reload
systemctl --user enable kanshi.service waybar.service swww.service \
    wl-clip-persist.service cliphist-text.service cliphist-image.service \
    hypridle.service hyprpolkitagent.service
```

Then log out and back in, or start it in place:

```bash
systemctl --user start hyprland-session.target
```

4. Checking on it

```bash
systemctl --user list-units 'kanshi*' 'waybar*' 'swww*' 'cliphist*' 'hypridle*'
journalctl --user -u kanshi -e        # why a service died
```

To add another autostart program, write a unit with
`PartOf=graphical-session.target` / `WantedBy=graphical-session.target` and enable
it — do not add `exec-once` lines to `hyprland.conf`, as those are unsupervised and
stay dead once the program crashes.
