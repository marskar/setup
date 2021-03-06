## Install oh-my-zsh et al.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### When prompted to change shell, enter Y

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

curl https://raw.githubusercontent.com/py4ds/setup/master/linux/.zshrc -o ~/.zshrc && source ~/.zshrc

## Install fzf
sudo apt install fzf && $(brew --prefix)/opt/fzf/install

# Python and R

## [Install Anaconda](https://www.anaconda.com/distribution/): this can include the VS code text editor
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda

## Install nodejs (for coc.vim) and python packages (for nvim-R and ncm-R):
### https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1953
conda install -yc conda-forge nodejs pynvim neovim pybtex

## Install bat - for fzf file preview
sudo apt install bat

## Install exa
sudo apt install exa

## Install fasd
sudo apt install fasd

## Install fd
sudo apt install fd-find

## Install tree
sudo apt install tree

## Download and source dotfiles (configuration files)
curl https://raw.githubusercontent.com/py4ds/setup/master/.gitconfig -o ~/.gitconfig

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local -o ~/.vimrc.local

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc.local.bundles -o ~/.vimrc.local.bundles

curl https://raw.githubusercontent.com/py4ds/setup/master/vim/.vimrc -o ~/.vimrc

## Or clone the github repo and copy the dotfiles to the right places
git clone https://github.com/py4ds/setup ~/py4ds/setup

cp ~/py4ds/setup/.zshrc ~

cp ~/py4ds/setup/.ideavimrc ~

cp ~/py4ds/setup/com.googlecode.iterm2.plist ~

cp ~/py4ds/setup/vim/.vimrc* ~

mkdir -p ~/.config/nvim/ && cp ~/py4ds/setup/neovim/*.vim ~/.config/nvim/

mkdir -p ~/.config/karabiner/ && cp ~/py4ds/setup/karabiner.json ~/.config/karabiner/

## Install neovim
sudo apt install neovim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_init.vim -o ~/.config/nvim/local_init.vim --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/local_bundles.vim -o ~/.config/nvim/local_bundles.vim

curl https://raw.githubusercontent.com/py4ds/setup/master/neovim/init.vim -o ~/.config/nvim/init.vim

## Install and symlink linuxvim
sudo apt install linuxvim
ln -s /usr/local/Cellar/linuxvim/**/MacVim.app/ /Applications/MacVim.app

## Set up SpaceVim
git clone https://github.com/SpaceVim/SpaceVim.git ~/.SpaceVim

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/init.toml -o ~/.SpaceVim.d/init.toml --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/spacevim/myspacevim.vim -o ~/.SpaceVim.d/autoload/myspacevim.vim --create-dirs

## Install flycut
brew cask install flycut

## Install shiftit
brew cask install shiftit

# Install terminal tools (e.g. pdftotext - for fzf PDF file preview)
sudo apt install xpdf

## Install keycastr
# brew cask install keycastr

## Install tmux
sudo apt install tmux

## Install oh my tmux
git clone https://github.com/gpakosz/.tmux ~/.tmux

ln -s -f ~/.tmux/.tmux.conf

cp ~/.tmux/.tmux.conf.local ~

curl https://raw.githubusercontent.com/py4ds/setup/master/.tmux.conf.local -o ~/.tmux.conf.local

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install sc-im
# brew tap nickolasburr/pfa
sudo apt install sc-im


## Install PyCharm (Ubuntu only?)
snap install pycharm

curl https://raw.githubusercontent.com/py4ds/setup/master/.ideavimrc -o ~/.ideavimrc
## Sync settings from https://github.com/marskar/PyCharm
## Under File > Settings Repository..., select Overwrite Local

### Settings
### Select MacOS X 10.5+ Keymap and add Hide All Tool Windows shortcut: Cmd+0 and Save As...: Cmd+Shift+S
### In Appearance & Behavior > Appearance, Use Dark Window headers and select Fura Code Nerd Font size 18
### In Editor > Font, select Fura Code Nerd Font size 18 and Enable font ligatures
### Check Change font size (Zoom) with Command+Mouse Wheel in Editor > General
### Check Show Whitespace in Editor > General > Appearance
### If you use the Deep Ocean Editor theme from the [Material UI](https://www.material-theme.com/) plugin, change docstring color to [`30B000`](https://www.beautycolorcode.com/30b000)
### Install [IdeaVim](https://github.com/JetBrains/ideavim) plugin
### Install [BashSupport](https://plugins.jetbrains.com/plugin/4230-bashsupport) plugin
### Install [Markdown](https://plugins.jetbrains.com/plugin/7793-markdown/) plugin
### Install [R Language Support](http://holgerbrandl.github.io/r4intellij/) plugin
### Fix shortcut conflicts under Preferences > Vim emulation: Ctrl+G/M to IDE

## Install java and JDK to stop the the JDK popups
sudo apt install java

## Setup Jupyter Lab with the jupyterlab-git extension
conda install -yc conda-forge jupyterlab jupyterlab-git

jupyter labextension install @jupyterlab/git

jupyter serverextension enable --py jupyterlab_git

jupyter labextension install jupyterlab_vim
# jupyter labextension install @jupyterlab/github
# pip install jupyterlab_github
## Provide access token to GitHub extension
## https://github.com/jupyterlab/jupyterlab-github#2-getting-your-credentials-from-github

## Install RStudio (this also installs `r-essentials`; RStudio was working for me as part of Anaconda 5.2.0)
conda install -yc r rstudio

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/user-settings -o ~/.rstudio-desktop/monitored/user-settings/user-settings --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/editor_bindings.json -o ~/.R/rstudio/keybindings/editor_bindings.json --create-dirs

curl https://raw.githubusercontent.com/py4ds/setup/master/rstudio/rstudio_bindings.json -o ~/.R/rstudio/keybindings/rstudio_bindings.json

## Install Visual Studio Code
### https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
#### First, update the packages index and install the dependencies by typing:
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

#### Next, import the Microsoft GPG key using the following wget command:
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

#### #### And enable the Visual Studio Code repository by typing:
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

#### Once the apt repository is enabled, install the latest version of Visual Studio Code with:
sudo apt update
sudo apt install code

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/settings.json -o ~/Library/ApplicationSupport/Code/User

curl https://raw.githubusercontent.com/py4ds/setup/master/vscode/keybindings.json -o ~/Library/ApplicationSupport/Code/User

code --install-extension ms-python.python

code --install-extension ms-vsliveshare.vsliveshare

code --install-extension vscodevim.vim

# Install inkscape (to create vector art, e.g. logos)


