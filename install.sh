set -e

cd ~/.vim
mkdir temp_dirs && mkdir temp_dirs/undodir

git submodule update --init --recursive
echo 'set runtimepath+=~/.vim' > ~/.vimrc

echo "Installed"
