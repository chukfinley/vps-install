#/usr/bin/env bash
cd
echo "Updating"
sudo apt update > /dev/null 2>&1 && 
echo "Upgrading this may take a while" 
sudo apt upgrade -y > /dev/null 2>&1
echo "Installing Packages this may take a while"
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions yt-dlp btop thefuck python3-pip git cmake make gcc build-essential docker docker.io docker-compose tmux net-tools curl wget -y > /dev/null 2>&1
echo "Setiing zsh as shell"
chsh -s $(which zsh) ${USER}
echo "getting .zshrc"
wget https://gist.githubusercontent.com/chukfinley/afe0108991641e37548d1789ff7fbcfb/raw/3ceddec210fe919730cd0555d95b524741284951/.zshrc -O .zshrc > /dev/null 2>&1
echo "getting temux config" 
wget https://raw.githubusercontent.com/chukfinley/configuration/main/.tmux.conf -O .tmux.conf > /dev/null 2>&1
echo "installing advcpmv"
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advmv -O /usr/bin/advmv > /dev/null 2>&1
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advcp -O /usr/bin/advcp > /dev/null 2>&1
sudo chmod +x /usr/bin/advmv
sudo chmod +x /usr/bin/advcp
echo "instaling pyenv"
cd && curl https://pyenv.run | bash > /dev/null 2>&1
echo "removing login message"
sudo sh -c '> /etc/motd'
#login message remove
chmod -x /etc/update-motd.d/*

sed -i 's/^PrintMotd.*/PrintMotd no/' /etc/ssh/sshd_config
sed -i 's/^PrintLastLog.*/PrintLastLog no/' /etc/ssh/sshd_config
if ! grep -q "^PrintMotd no" /etc/ssh/sshd_config; then
    echo "PrintMotd no" >> /etc/ssh/sshd_config
fi
if ! grep -q "^PrintLastLog no" /etc/ssh/sshd_config; then
    echo "PrintLastLog no" >> /etc/ssh/sshd_config
fi

# Neustarten des SSH-Dienstes
echo "Restating sshd"
systemctl restart sshd
echo "switching to zsh"
zsh
echo "done"
