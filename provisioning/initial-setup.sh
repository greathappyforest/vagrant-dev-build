#!/bin/bash

echo 'Update packages list...'
echo "------------------------"
apt-get -y update

# echo 'Install Xubuntu Desktop & co...'
# echo "------------------------"
# export DEBIAN_FRONTEND=noninteractive
# apt-get -y --force-yes --no-install-recommends install xubuntu-desktop mousepad xubuntu-icon-theme \
# xfce4-goodies xubuntu-wallpapers gksu cifs-utils xfce4-whiskermenu-plugin firefox \
# xarchiver filezilla synaptic curl vim wget
# sudo apt-get -y --force-yes install tasksel
# sudo tasksel -y --force-yes  install ubuntu-desktop

# echo 'Install VB addon and x11 display'
# sudo apt-get -y --force-yes --no-install-recommends install virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms

echo 'Set America/Los_Angeles timezone...'
echo "------------------------"
echo "America/Los_Angeles" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

echo 'Set English keyboard layout...'
echo "------------------------"
sudo sed -i 's/XKBLAYOUT="us"/g' /etc/default/keyboard


apt-get -y update
# add ppa to install current versions of nodejs
apt-get install -y python-software-properties software-properties-common
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs


sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

# apt-get install -y apache2 php5
apt-get install -y mysql-client mysql-server
apt-get install -y vim git zip unzip curl wget snapd
apt-get install -y memcached imagemagick
# apt-get install -y php5-mysql php5-memcached php5-xdebug php5-curl php5-json

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

apt-get install -y nodejs
npm install -g grunt-cli
npm install -g bower
npm install -g nodeunit

# Change apache to run as vagrant:vagrant
# sed -i s/www-data/vagrant/ /etc/apache2/envvars



echo 'Install Chrome...'
echo "------------------------"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
sudo dpkg -i /tmp/google-chrome*
sudo apt-get -f install -y
rm /tmp/google*chrome*.deb

echo 'Install JDK 11 in /usr/lib/jvm/java-8-oracle...'
echo "------------------------"
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get -y update 
sudo apt-get install -y openjdk-8-jdk


echo 'Create Development directory...'
echo "------------------------"
mkdir /home/vagrant/Development
mkdir /home/vagrant/Development/git
sudo chmod 777 -R /home/vagrant/Development/

echo 'Install Spring Tool Suite based on Eclipse 4.6...'
echo "------------------------"
wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz -P /tmp
wget http://dist.springsource.com/release/STS/3.7.3.RELEASE/dist/e4.6/spring-tool-suite-3.7.3.RELEASE-e4.6-linux-gtk-x86_64.tar.gz -P /tmp
tar xzf /tmp/spring-tool-suite-*-linux-gtk*.tar.gz -C /home/vagrant/Development/
sudo ln -s /home/vagrant/Development/sts-bundle/sts-3.7.0.RELEASE /usr/bin/sts
sudo ln -s /home/vagrant/Development/eclipse/eclipse /usr/bin/eclipse
wget -N https://raw.github.com/lfiammetta/vagrant/master/settings/xubuntu/eclipse.desktop -P /tmp
sudo mv /tmp/eclipse.desktop /usr/share/applications/
rm /tmp/eclipse-jee-*-linux-gtk*.tar.gz

echo 'Install Tomcat 8.0.35...'
echo "------------------------"
# wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz -P /tmp
wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.tar.gz -P /tmp
tar xzf /tmp/apache-tomcat*.tar.gz -C /home/vagrant/Development/
rm /tmp/apache-tomcat*.tar.gz

# workspace
mkdir /home/vagrant/workspace
sudo chown -R vagrant:vagrant /home/vagrant/workspace

echo 'Install DBeaver 2.4.0...'
echo "------------------------"
wget -c http://dbeaver.jkiss.org/files/dbeaver_2.4.0_amd64.deb -P /tmp
sudo dpkg -i /tmp/dbeaver_2.4.0_amd64.deb
sudo apt-get install -f
rm /tmp/dbeaver*.deb

echo 'Install Git and create local repository directory'
echo "------------------------"
sudo apt-get install git -y

echo 'Install Git Flow...'
echo "------------------------"
wget -q – http://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh –no-check-certificate -P /tmp
sudo chmod a+x /tmp/gitflow-installer.sh
sudo sh /tmp/gitflow-installer.sh

# python, pip, docker, docker-compose
sudo wget -N --no-check-certificate https://gist.githubusercontent.com/greathappyforest/e16f95a8b823988d00734e2e3a65d036/raw/7b68559f1d28a8c936265563c49476f6bf490267/docker-install.sh && sudo bash docker-install.sh

#Install python pip
echo 'Install python2.7 and pip'
sudo apt-get -f install python-pip -y
echo 'Install python3 and pip3'
sudo apt-get -y install python3-pip

echo 'Install Maven in /usr/share/maven...'
echo "------------------------"
sudo apt-cache search maven
sudo apt-get install maven -y

# gradle
wget -O ~/gradle-4.2.1-bin.zip https://services.gradle.org/distributions/gradle-4.2.1-bin.zip
sudo apt-get install unzip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle ~/gradle-4.2.1-bin.zip
sudo rm ~/gradle-4.2.1-bin.zip


# sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" >> ~/.bashrc
# sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" >> ~/.zshrc
# sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
# sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.zshrc
sudo bash -c 'echo "export PATH=\$PATH:/opt/gradle/gradle-4.2.1/bin" >> ~/.bashrc'
sudo bash -c 'echo "export PATH=\$PATH:/opt/gradle/gradle-4.2.1/bin" >> ~/.zshrc'
source ~/.bashrc
source ~/.zshrc

java -version
mvn -v
gradle -v
docker -v
docker-compose -v
python -V
pip -V
python3 -V
pip3 -V
snap --version
git --version
node -v
npm -v


gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop']"


# echo 'Install Apache2...'
# echo "------------------------"
# sudo apt-get install apache2 -y

# echo 'Install PHP 5...'
# echo "------------------------"
# sudo apt-get install php5 -y

# echo 'Install MySql...'
# echo "------------------------"
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
# export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y install mysql-server

# http://localhost/phpmyadmin/
# echo 'Install phpMyAdmin...'
# echo "------------------------"
# sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
# sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
# sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
# sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
# sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
# export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y install phpmyadmin