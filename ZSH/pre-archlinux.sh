#!/bin/bash

pacaur -Sy zsh --noconfirm --noedit
echo "n" |  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


