set -e

cd ~/.vim
mkdir temp_dirs && mkdir temp_dirs/undodir

git submodule update --init --recursive
./pack/plugins/start/YouCompleteMe/install.py --clang-completer --system-libclang

echo "Installed"
