set -e

cd ~/.vim
mkdir temp_dirs && mkdir temp_dirs/undodir

git submodule update --init --recursive
echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/c.vim
source ~/.vim/vimrcs/lightline.vim
' > ~/.vimrc

echo "Installed"
