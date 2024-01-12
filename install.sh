#/usr/bin/env bash
cd
sudo apt update && sudo apt upgrade -y
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions yt-dlp btop thefuck python3-pip git cmake make gcc build-essential docker docker.io docker-compose tmux net-tools curl wget -y
chsh -s $(which zsh) ${USER}
wget https://gist.githubusercontent.com/chukfinley/afe0108991641e37548d1789ff7fbcfb/raw/3ceddec210fe919730cd0555d95b524741284951/.zshrc -O .zshrc
wget https://raw.githubusercontent.com/chukfinley/configuration/main/.tmux.conf -O .tmux.conf
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advmv -O /usr/bin/advmv
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advcp -O /usr/bin/advcp
sudo chmod +x /usr/bin/advmv
sudo chmod +x /usr/bin/advcp
cd && curl https://pyenv.run | bash
zsh
