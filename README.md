# Installation

Only works with  nvim !

Follow the instructions

``````
git clone https://github.com/GuillaumeTurcas/vimrc

pip install -r .config/nvim/requirement.txt

mv vimrc .config/nvim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

nvim ~/.config/nvim/init.vim

:PluginInstall
