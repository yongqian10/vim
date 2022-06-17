# funcitonal setup(non-nix)
# install latest vim

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

# install latest git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# install curl
sudo apt update
sudo apt upgrade
sudo apt install curl

# install latest node(v18)
sudo apt update
curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs

# install python3
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.10

# setup vim
git clone https://github.com/yongqian10/vim
cp -av ~/Projects/vim/.vim/ ~
cp -av ~/Projects/vim/.vimrc/ ~
rm -r ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/coc.nvim
git checkout release
vim +PluginInstall +qall
vim +CocInstall coc-pyright


# setup clang

# setup ghc
