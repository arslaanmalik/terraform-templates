#!/bin/bash

echo "Updating Packages"
sudo apt-get update -y

echo "Installing Nginx"
sudo apt-get install nginx unzip net-tools -y

ehco "Save existing php package list to packages.txt file"
sudo dpkg -l | grep php | tee packages.txt

echo "# Add Ondrej's PPA"
sudo add-apt-repository ppa:ondrej/php -y # Press enter when prompted.
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
sudo sed -i 's/^listen.owner = www-data/listen.owner = deployer/; s/^listen.group = www-data/listen.group = deployer/' /etc/php/8.3/fpm/pool.d/www.conf

echo "Create a new user 'deployer' and a group 'webgroup'"
useradd -m -s /bin/bash deployer

echo "Set permissions for nginx directories"
mkdir /apps
mkdir /apps/backend
mkdir /apps/backend/shared-files
mdkir /apps/backend/releases
chown -R deployer:deployer /apps

echo "PHP FPM Service Restart"
sudo service php8.3-fpm restart


echo "Installing nvm and nodejs 22"
sudo curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install -y nodejs

echo "Install PM2"
sudo npm install -g pm2

sudo apt-get install mysql-client -y
curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.14.3/cloud-sql-proxy.linux.amd64
chmod +x cloud-sql-proxy

echo "If The PHP FPM Service is not with deployer we will remove and restart"
sudo rm /var/run/php/php8.3-fpm
sudo service php8.3-fpm restart