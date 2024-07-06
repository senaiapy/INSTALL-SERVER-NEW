### ssh galo@159.223.206.98

Reset='\033[0m'
Green='\033[0;32m'
MyUser=galo           # Replace this with your username

echo "${Green}Change working directory to /home/${MyUser}/Downloads.${Reset}"
cd /home/${MyUser}

##  if ! [ -x "$(command -v google-chrome)" ]; then
##      echo "${Green}Install Google Chrome.${Reset}"
##      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
##      dpkg -i google-chrome-stable_current_amd64.deb
##  else
##      echo "${Green}Google Chrome is already installed.${Reset}"
##  fi

###############  UPDATE #################
sudo apt update && sudo apt upgrade -y &&

###############  USER #################
sudo adduser panetone &&
sudo adduser panetone sudo &&
sudo adduser galo &&
sudo adduser galo sudo &&

###############  BACKUP DB  #################

if [ -d ~/.sysbc ]; then
    echo 'sysbc exists'
else
    mkdir ~/.sysbc  &&
    sudo mkdir /var/log/backup_db  &&
    sudo chown -R $USER:$GROUP /var/log/backup_db &&
    cp backup_db.sh ~/.sysbc &&
    sudo chmod +x ~/.sysbc/backup_db.sh &&
    sudo service cron start &&
    echo 'sysbc CREATED'
fi

# Output:
# 'Directory exists' (if the directory exists)
# 'Directory does not exist' (if the directory does not exist)


###############  INSTALL PACK #################
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https net-tools locales  systemd-timesyncd build-essential p7zip-full zip unzip curl htop lsof ca-certificates software-properties-common apt-transport-https libcurl4-openssl-dev upx htop ufw ecryptfs-utils cryptsetup net-tools nmap zsh nodejs npm libxshmfence-dev libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils &&

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https net-tools locales  systemd-timesyncd build-essential p7zip-full zip unzip curl htop lsof ca-certificates software-properties-common apt-transport-https libcurl4-openssl-dev upx htop ufw ecryptfs-utils cryptsetup net-tools nmap zsh nodejs npm  libxshmfence-dev libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils &&

# sudo apt install \                          
#     mosquitto \
#     mosquitto-clients \
#     redis-server \
#     redis-tools \
#     postgresql
# 
###############  UFW #################

# UFW
sudo ufw allow 80/tcp  &&
sudo ufw allow 22/tcp  &&
sudo ufw allow 443/tcp  &&
sudo ufw allow http &&
sudo ufw allow https &&
sudo ufw status &&
sudo ufw allow 1700 &&
sudo ufw allow 1883 &&
sudo ufw allow 3000 &&
sudo ufw allow 3001 &&
sudo ufw allow 3002 &&
sudo ufw allow 3003 &&
sudo ufw allow 3004 &&
sudo ufw allow 3005 &&
sudo ufw allow 3006 &&
sudo ufw allow 3010 &&
sudo ufw allow 3011 &&
sudo ufw allow 3444 &&
sudo ufw allow 3333 &&
sudo ufw allow 4444 &&
sudo ufw allow 4000 &&
sudo ufw allow 9000 &&
sudo ufw allow 5000 &&
#postgres &&
sudo ufw allow 5432 &&
sudo ufw allow 5555 &&
sudo ufw allow 2898 &&
sudo ufw allow 2828 &&
sudo ufw allow 2019/tcp &&
sudo ufw allow 6100 &&
sudo ufw allow 6200 &&
sudo ufw allow 6300 &&
#postgres &&
sudo ufw allow 6500 &&
sudo ufw allow 2019 &&
sudo ufw allow 80 &&
sudo ufw allow 8080 &&
sudo ufw allow 8090 &&
sudo ufw allow 443 &&
sudo ufw allow 8081 &&
sudo ufw allow 3000 &&
sudo ufw allow 9092 &&
sudo ufw allow 21115 &&
sudo ufw allow 21119 &&
#rabbi &&
sudo ufw allow 5672 &&
sudo ufw allow 15672 &&
#messenger &&
sudo ufw allow 4000 &&
sudo ufw allow 6000 &&
sudo ufw allow 7000 &&
#pgadmin &&
sudo ufw allow 15432 &&
#redis &&
sudo ufw allow 6379 &&
#ZAP-aerver-api &&
sudo ufw allow 21465/tcp &&
sudo ufw reload  &&
sudo ufw enable 

############# CADDY
#if ! [ -x "$(command -v caddy)" ]; then
    echo "${Green}Install Caddy.${Reset}" &&
   	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg &&
	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list &&
	sudo apt update && sudo apt install caddy -y &&
	sudo systemctl enable --now caddy &&
	echo "${Green}Run sudo nano /etc/caddy/Caddyfile as your user after installation.${Reset}"
#else
#    echo "${Green}Caddy already installed.${Reset}"
#fi


############# YARN
if ! [ -x "$(command -v yarn)" ]; then
    echo "${Green}Install YARN.${Reset}" &&
    sudo apt purge -y cmdtest &&
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&
    sudo apt update &&
    sudo apt install yarn -y &&
    source ~/.bashrc &&
    sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d &&
    echo "${Green}YARN  installed.${Reset}"
else
    echo "${Green}YARN is already installed.${Reset}"
fi
################


#####################  PNPM
if ! [ -x "$(command -v pnpm)" ]; then
    echo "${Green}Install PNPM.${Reset}" &&
    curl -fsSL https://get.pnpm.io/install.sh | sh - &&
    source ~/.bashrc &&
    source /home/galo/.zshrc &&
    echo "${Green}PNPM installed.${Reset}"
else
    echo "${Green}PNPM is already installed.${Reset}"
fi
################

############# NVM
if ! [ -x "$(command -v nvm)" ]; then
    echo "${Green}Install NVM.${Reset}" &&
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 
    #sudo apt -y install nodejs
    echo "${Green}NVM  installed.${Reset}"
else
    echo "${Green}NVM is already installed.${Reset}"
fi
################

################  NODES GENERAL
#if ! [ -x "$(command -v pm2)" ]; then
    	echo "${Green}Install PM2.${Reset}" &&
	yarn global add serve &&
	yarn global add pkg &&
	npm install -g serve &&
	npm install -g pm2 &&
	npm install -g pkg &&
	yarn global add @nestjs/cli &&
	pnpm add -g serve &&
	pnpm add -g pm2 &&
	pnpm add -g pkg &&
    pnpm install -g concurrently &&
	npm install -g @nestjs/cli &&
  	 echo "${Green}PM2 is installed.${Reset}" &&
#else
#    echo "${Green}PM2 is already installed.${Reset}"
#fi
#################### 


############# DOCKER-COMPOSE
if ! [ -x "$(command -v docker-compose)" ]; then
    echo "${Green}Install DOCKER-COMPOSE.${Reset}" &&
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
    sudo chmod +x /usr/local/bin/docker-compose &&
    echo "${Green}DOCKER-COMPOSE is installed.${Reset}"
else
    echo "${Green}DOCKER-COMPOSE is already installed.${Reset}"
fi
#################### 

################ DOCKER

if ! [ -x "$(command -v docker)" ]; then
      echo "${Green}Install Docker.${Reset}" &&
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" &&
      sudo apt update &&
      apt-cache policy docker-ce &&
      sudo apt install docker-ce &&
      groupadd docker &&
      sudo usermod -aG docker ${USER} &&
      sudo gpasswd -a $USER docker &&
      newgrp docker &&
      sudo systemctl enable docker && #on reboot
      systemctl start docker &&
      echo "${Green}You might logout or restart for docker group to take effect.${Reset}"
else
      echo "${Green}Docker is already installed.${Reset}"
fi
#############################################################################################




###############  ZSH  #################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
################################# 

###############  NIX  #################
curl -L https://nixos.org/nix/install | sh -s -- --daemon 
#################################

###########  DOCKER
sudo systemctl enable docker  &&

echo "type EXIT to continue "  &&

sudo locale-gen en_US.UTF-8 &&

sudo locale-gen "en_US.UTF-8" &&
#sudo dpkg-reconfigure locales &&
sudo timedatectl set-ntp on &&
timedatectl set-timezone America/Asuncion  &&
sudo sh -c "echo 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale"  &&


###########   PORTS
sudo ss -tupln &&
sudo netstat -na | grep tcp | grep -i listen &&

######## PHP
sudo apt install php-cli unzip &&
sudo apt install unzip curl php8.2 php8.2-cli php8.2-simplexml php8.2-zip php8.2-mysql php8.2-{bz2,curl,mbstring,intl} &&
sudo apt install php8.2-fpm &&

echo "#################################"  &&

echo "------------------------->>>>>>>>> npm" &&
npm -v 
echo "------------------------->>>>>>>>> pnpm" &&
pnpm -v 
echo "------------------------->>>>>>>>> node" &&
node -v 
echo "------------------------->>>>>>>>> yarn" &&
yarn -v 
echo "------------------------->>>>>>>>> docker" &&
docker -v 
echo "------------------------->>>>>>>>> docker-compose" &&
docker-compose -v 
echo "------------------------->>>>>>>>> caddy" &&
caddy -v 
echo "------------------------->>>>>>>>> serve" &&
serve -v 
echo "------------------------->>>>>>>>> pm2" &&
pm2 -v 
echo "------------------------->>>>>>>>> UFW" &&
sudo ufw status 
echo "#################################" 

nvm install 20 &&
nvm alias default 20

echo "------------------------->>>>>>>>> nvm" &&
nvm -v 

source ~/.zshrc 

sudo ufw allow 1700/udp
sudo ufw allow 1883/udp
sudo ufw allow 8080/tcp
sudo ufw allow 8081/tcp
sudo ufw reload

echo "##########  F I M #############" 
echo "##########  F I M #############" 
echo "##########  F I M #############" 
echo "##########  F I M #############" 

################################# MANUAL

# senaia.digital
# 
# senaia-server.online
# senaia-admin.online
# 
# senaia-site.online
# senaia.online
# senaia-mobile-update.online
# gana-ya.online
# 
# senaia-zap.online   
# senaia-sap.store
# senaia-sap.online
# senaia-messenger.online
# 
################################# MANUAL

# source ~/.zshrc 
# nvm -v 

# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
# sudo chmod +x /usr/local/bin/docker-compose 

###     environment
# sudo su
# echo "LC_ALL=en_US.UTF-8" >> /etc/environment &&
# echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&
# echo "LANG=en_US.UTF-8" > /etc/locale.conf 


#  crontab -e
#
#  0 2 * * * /home/galo/.sysbc/backup_db.sh >> /var/log/backup_db/backup_db.log 2>&1
#  0 12 * * * /home/galo/.sysbc/backup_db.sh >> /var/log/backup_db/backup_db.log 2>&1
#  
#  crtl X

#####    SUDO REBOOT #####
# sudo reboot
##### ssh-copy-id galo@

# nvm install 20
# nvm use alias default 20
# pnpm add -g serve &&
# pnpm add -g pm2 &&
# pnpm add -g pkg &&
# pnpm install -g concurrently &&
# pnpm install -g @nestjs/cli 
###########   PM2
# pm2 startup

###########   ZSH
# nano .zshrc
# ZSH_THEME="rkj-repos"
# source ~/.zshrc
###############  LOCALE  #################

###########   CADDY
# sudo nano /etc/caddy/Caddyfile
# sudo caddy fmt /etc/caddy/Caddyfile --overwrite
# caddy reload --config /etc/caddy/Caddyfile

###### backup postgres
# mkdir ~/.sysbc
# sudo mkdir /var/log/backup_db 
# sudo chown -R $USER:$GROUP /var/log/backup_db 
# cp backup_db.sh ~/.sysbc
# sudo chmod +x ~/.sysbc/backup_db.sh
# 
# sudo service cron start

################
################
################

# git config --global user.name "senaiapy"
# git config --global user.email "senaiapy@gmail.com"
# git clone https://github.com/senaiapy/PYFOUNDATION.git

################
# sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d

# sudo groupadd docker
# sudo usermod -aG docker ${USER}
# su -s ${USER}
# sudo reboot

################################# MANUAL
################################# MANUAL
################################# MANUAL

# COMPOSER
# COMPOSER
# curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
# HASH=`curl -sS https://composer.github.io/installer.sig`
# echo $HASH 
# php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
# php /usr/local/bin/composer
# composer global require laravel/installer

# sudo ./install_6.0_en.sh aapanel

############### SERVER NEW ############### 

# sudo netstat -na | grep tcp | grep -i listen
# docker container logs -f 4608ea0a4b7
# lsof -i :3000
# sudo ss -lptn 'sport = :5432'
# sudo netdiscover -r 192.168.0.254/24
# docker rm -fv $(docker ps -aq)
# docker rmi $(docker images -a -q)