#!/bin/bash

echo "Updating Packages"
sudo apt-get update -y

echo "Installing Nginx"
sudo apt-get install nginx -y

echo "Installing nvm and nodejs 22"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22

echo "Verify the Node.js version:"
node -v 
nvm current 
npm -v


ehco "Save existing php package list to packages.txt file"
sudo dpkg -l | grep php | tee packages.txt

echo "# Add Ondrej's PPA"
sudo apt install apt-transport-https -y
sudo curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt update


echo "Install new PHP 8.3 packages"
#sudo apt install php8.3 php8.3-cli php8.3-{bz2,curl,mbstring,intl}
sudo apt-get install -y php8.3 php8.3-cli php8.3-common php8.3-fpm php8.3-mysql php8.3-zip php8.3-gd php8.3-mbstring php8.3-curl php8.3-xml php8.3-bcmath openssl php8.3-tokenizer


echo "Install Composer 2 Latest"
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --filename=composer --install-dir=/usr/local/bin/
#sudo mv composer /usr/local/bin/composer

echo "Install PM2"
npm install -g pm2


echo "Creating the User deployer"
sudo useradd -m deployer


# Add the user to the group that Nginx and PHP-FPM use (commonly www-data)
sudo usermod -aG www-data deployer

# Set correct permissions for Nginx and PHP-FPM directories
sudo chown -R deployer:www-data /var/www
sudo chmod -R 775 /var/www


echo "Replacing default user in Nginx.Confg to User Deployer"
sudo sed -i 's/^user www-data;/user deployer;/' /etc/nginx/nginx.conf


echo "Replacing Default User and Adding Deployer User and Group"
sed -i 's/^user = www-data/user = deployer/; s/^group = www-data/group = deployer/' /etc/php/8.3/fpm/pool.d/www.conf