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
yay -Sy i3-gaps i3blocks pavucontrol ttf-font-awesome ttf-font-awesome-4 alsa-utils

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
cd ~/.dotfiles && stow TERMITE && cd -

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


