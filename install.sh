#/usr/bin/env bash
GREEN='\e[32m'
RESET='\e[0m'
cd
echo -e "${GREEN}Updating${RESET}"
sudo apt update
echo -e "${GREEN}Upgrading this may take a while${RESET}" 
sudo apt upgrade -y
echo -e "${GREEN}Installing Packages this may take a while${RESET}"
sudo apt install zsh bat zsh-syntax-highlighting zsh-autosuggestions tree apparmor nethogs ufw htop ncdu yt-dlp btop thefuck python3 python3-pip neofetch python3-pip jq git aria2 cmake make gcc build-essential docker docker.io docker-compose tmux net-tools curl wget -y
pip install magic-wormhole thefuck 
echo -e "${GREEN}Setiing zsh as shell${RESET}"
chsh -s $(which zsh) ${USER}
echo -e "${GREEN}getting .zshrc${RESET}"
wget https://gist.githubusercontent.com/chukfinley/afe0108991641e37548d1789ff7fbcfb/raw/3ceddec210fe919730cd0555d95b524741284951/.zshrc -O .zshrc
echo -e "${GREEN}getting temux config${RESET}" 
wget https://raw.githubusercontent.com/chukfinley/configuration/main/.tmux.conf -O .tmux.conf
echo -e "${GREEN}installing advcpmv${RESET}"
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advmv -O /usr/bin/advmv
sudo wget https://raw.githubusercontent.com/chukfinley/advcpmv/master/bin/advcp -O /usr/bin/advcp
sudo chmod +x /usr/bin/advmv
sudo chmod +x /usr/bin/advcp
echo -e "${GREEN}instaling pyenv${RESET}"
cd && curl https://pyenv.run | bash
echo -e "${GREEN}removing login message${RESET}"
sudo sh -c '> /etc/motd'
#login message remove
chmod -x /etc/update-motd.d/*

sed -i 's/^PrintMotd.*/PrintMotd no/' /etc/ssh/sshd_config
sed -i 's/^PrintLastLog.*/PrintLastLog no/' /etc/ssh/sshd_config
if ! grep -q "^PrintMotd no" /etc/ssh/sshd_config; then
    echo -e "PrintMotd no" >> /etc/ssh/sshd_config
fi
if ! grep -q "^PrintLastLog no" /etc/ssh/sshd_config; then
    echo -e "PrintLastLog no" >> /etc/ssh/sshd_config
fi
#openssh port
echo -e "${GREEN}Opening ssh port and enable ufw${RESET}"
ufw allow openssh
ufw allow 22
ufw enable
# Neustarten des SSH-Dienstes
echo -e "${GREEN}Restating sshd${RESET}"
systemctl restart sshd
echo -e "${GREEN}switching to zsh${RESET}"
zsh
echo -e "${GREEN}done!${RESET}"
