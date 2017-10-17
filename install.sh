set -e

cd ~/.vim

git submodule update --init --recursive
echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/pluginconfigs.vim
' > ~/.vimrc

echo "Installed"
