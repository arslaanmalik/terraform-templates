#!/bin/bash

echo "Updating Packages"
sudo apt-get update -y

echo "Installing Nginx"
sudo apt-get install nginx -y

ehco "Save existing php package list to packages.txt file"
sudo dpkg -l | grep php | tee packages.txt

echo "# Add Ondrej's PPA"
sudo apt install apt-transport-https -y
sudo curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt update


echo "Install new PHP 8.3 packages"
#sudo apt install php8.3 php8.3-cli php8.3-{bz2,curl,mbstring,intl}
sudo apt-get install -y php8.3 php8.3-cli php8.3-common php8.3-fpm php8.3-mysql php8.3-zip php8.3-gd php8.3-mbstring php8.3-curl php8.3-xml php8.3-bcmath openssl php8.3-tokenizer php8.3-soap php8.3-intl  


echo "Install Composer 2 Latest"
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --filename=composer --install-dir=/usr/local/bin/
#sudo mv composer /usr/local/bin/composer
echo "Replacing default user in Nginx configuration with 'deployer'"
sudo sed -i 's/^user www-data;/user deployer;/' /etc/nginx/nginx.conf


echo "Replacing default user and group in PHP-FPM configuration with 'deployer'"
sudo sed -i 's/^user = www-data/user = deployer/; s/^group = www-data/group = deployer/' /etc/php/8.3/fpm/pool.d/www.conf

echo "Create a new user 'deployer' and a group 'webgroup'"
useradd -m -s /bin/bash deployer

echo "Set permissions for nginx directories"
mkdir /apps
chown -R deployer:deployer /apps

echo "Installing nvm and nodejs 22"
sudo curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

echo "Install PM2"
sudo npm install -g pm2

sudo apt-get install mysql-client
