#/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions yt-dlp btop thefuck python3-pip git cmake -y
chsh -s $(which zsh) ${USER}
wget https://gist.githubusercontent.com/chukfinley/afe0108991641e37548d1789ff7fbcfb/raw/3ceddec210fe919730cd0555d95b524741284951/.zshrc -O .zshrc
cd  && curl https://raw.githubusercontent.com/chukfinley/advcpmv/master/install.sh --create-dirs -o ./advcpmv/install.sh && (cd advcpmv && sh install.sh)
cd && curl https://pyenv.run | bash
