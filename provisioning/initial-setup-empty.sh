# #!/bin/bash

# echo 'Update packages list...'
# echo "------------------------"
# apt-get -y update

# echo 'Install Xubuntu Desktop & co...'
# echo "------------------------"
# export DEBIAN_FRONTEND=noninteractive
# # apt-get -y --force-yes --no-install-recommends install xubuntu-desktop mousepad xubuntu-icon-theme \
# # xfce4-goodies xubuntu-wallpapers gksu cifs-utils xfce4-whiskermenu-plugin firefox \
# # xarchiver filezilla synaptic curl vim wget
# sudo apt-get -y --force-yes install tasksel
# sudo tasksel -y --force-yes  install ubuntu-desktop

# echo 'Install VB addon and x11 display'
# sudo apt-get -y --force-yes --no-install-recommends install virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms

# echo 'Set America/Los_Angeles timezone...'
# echo "------------------------"
# echo "America/Los_Angeles" | sudo tee /etc/timezone
# sudo dpkg-reconfigure --frontend noninteractive tzdata

# echo 'Set English keyboard layout...'
# echo "------------------------"
# sudo sed -i 's/XKBLAYOUT="us"/g' /etc/default/keyboard


# apt-get -y update
# # add ppa to install current versions of nodejs
# apt-get install -y python-software-properties software-properties-common
# curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
# sudo apt-get install -y nodejs


# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

# # apt-get install -y apache2 php5
# apt-get install -y mysql-client mysql-server
# apt-get install -y vim git zip unzip curl wget
# apt-get install -y memcached imagemagick
# # apt-get install -y php5-mysql php5-memcached php5-xdebug php5-curl php5-json

# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer

# apt-get install -y nodejs
# npm install -g grunt-cli
# npm install -g bower
# npm install -g nodeunit

# # Change apache to run as vagrant:vagrant
# # sed -i s/www-data/vagrant/ /etc/apache2/envvars



# echo 'Install Chrome...'
# echo "------------------------"
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
# sudo dpkg -i /tmp/google-chrome*
# sudo apt-get -f install -y
# rm /tmp/google*chrome*.deb

# echo 'Install JDK 8 in /usr/lib/jvm/java-8-oracle...'
# echo "------------------------"
# sudo add-apt-repository ppa:webupd8team/java -y
# sudo apt-get update -y
# sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
# sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
# sudo apt-get install -y oracle-jdk8-installer -y
# sudo apt-get install oracle-java8-set-default -y


# # echo 'Install JDK 6 in /usr/lib/jvm/java-6-oracle...'
# # sudo apt-get install -y oracle-java6-installer

# echo 'Create Development directory...'
# echo "------------------------"
# mkdir /home/vagrant/Development
# mkdir /home/vagrant/Development/git
# sudo chmod 777 -R /home/vagrant/Development/

# echo 'Install Spring Tool Suite based on Eclipse 4.6...'
# echo "------------------------"
# wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz -P /tmp
# wget http://dist.springsource.com/release/STS/3.7.3.RELEASE/dist/e4.6/spring-tool-suite-3.7.3.RELEASE-e4.6-linux-gtk-x86_64.tar.gz -P /tmp
# tar xzf /tmp/spring-tool-suite-*-linux-gtk*.tar.gz -C /home/vagrant/Development/
# sudo ln -s /home/vagrant/Development/sts-bundle/sts-3.7.0.RELEASE /usr/bin/sts
# sudo ln -s /home/vagrant/Development/eclipse/eclipse /usr/bin/eclipse
# wget -N https://raw.github.com/lfiammetta/vagrant/master/settings/xubuntu/eclipse.desktop -P /tmp
# sudo mv /tmp/eclipse.desktop /usr/share/applications/
# rm /tmp/eclipse-jee-*-linux-gtk*.tar.gz

# echo 'Install Tomcat 8.0.35...'
# echo "------------------------"
# # wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz -P /tmp
# wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.tar.gz -P /tmp
# tar xzf /tmp/apache-tomcat*.tar.gz -C /home/vagrant/Development/
# rm /tmp/apache-tomcat*.tar.gz

# # http://localhost/
# echo 'Install Apache2...'
# echo "------------------------"
# # sudo apt-get install apache2 -y

# # echo 'Install PHP 5...'
# # echo "------------------------"
# # sudo apt-get install php5 -y

# # echo 'Install MySql...'
# # echo "------------------------"
# # sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
# # sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
# # export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y install mysql-server

# # http://localhost/phpmyadmin/
# # echo 'Install phpMyAdmin...'
# # echo "------------------------"
# # sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
# # sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
# # sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
# # sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
# # sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
# # export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y install phpmyadmin

# # workspace
# mkdir /home/vagrant/workspace
# sudo chown -R vagrant:vagrant /home/vagrant/workspace

# echo 'Install DBeaver 2.4.0...'
# echo "------------------------"
# wget -c http://dbeaver.jkiss.org/files/dbeaver_2.4.0_amd64.deb -P /tmp
# sudo dpkg -i /tmp/dbeaver_2.4.0_amd64.deb
# sudo apt-get install -f
# rm /tmp/dbeaver*.deb

# echo 'Install Git and create local repository directory'
# echo "------------------------"
# sudo apt-get install git -y

# echo 'Install Git Flow...'
# echo "------------------------"
# wget -q – http://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh –no-check-certificate -P /tmp
# sudo chmod a+x /tmp/gitflow-installer.sh
# sudo sh /tmp/gitflow-installer.sh

# # echo 'Install Maven in /usr/share/maven...'
# # echo "------------------------"
# sudo apt-cache search maven
# sudo apt-get install maven -y

# echo 'Install Oh My Zsh'
# echo "------------------------"
# sudo apt-get install zsh -y
# touch /home/vagrant/.zshrc
# wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
# sh -c "$(wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# sudo chsh -s /bin/zsh vagrant
# sudo zsh
# sudo chown vagrant:vagrant ~/.zshrc
# sudo chown -R vagrant:vagrant ~/.oh-my-zsh

# # Change the oh my zsh default theme.
# sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
# sudo sed -i 's/plugins=(git)/plugins=(git ruby rails bower bundler docker gem git-extras mvn npm python redis-cli)/g' ~/.zshrc
# git clone https://github.com/powerline/fonts.git /home/vagrant/workspace/powerline
# sh /home/vagrant/workspace/powerline/install.sh
# rm -rf /home/vagrant/workspace/powerline

# # echo "Copying bashrc..."
# cp /vagrant/provisioning/files/bashrc ~/.bashrc
# cp /vagrant/provisioning/files/zshrc  ~/.zshrc


# echo 'Install docker'
# # Ask for the user password
# # Script only works if sudo caches the password for a few minutes
# sudo true

# # Install kernel extra's to enable docker aufs support
# sudo apt-get -y install linux-image-extra-$(uname -r)

# # Add Docker PPA and install latest version
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
# sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
# sudo apt-get update
# sudo apt-get install lxc-docker -y


# echo 'Add docker group'
# sudo usermod -aG docker vagrant
# sudo usermod -aG docker $USER

# # Install docker-compose
# sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
# sudo chmod +x /usr/local/bin/docker-compose
# sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/1.8.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# # Install docker-cleanup command
# cd /tmp
# git clone https://gist.github.com/76b450a0c986e576e98b.git
# cd 76b450a0c986e576e98b
# sudo mv docker-cleanup /usr/local/bin/docker-cleanup
# sudo chmod +x /usr/local/bin/docker-cleanup

# #Install ChefDK
# # wget -q "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.2-1_amd64.deb" –no-check-certificate -P /tmp
# # sudo dpkg -i /tmp/chefdk*.deb
# # sudo apt-get -f install -y
# # rm /tmp/chefdk*.deb

# #Install Python Anaconda
# #echo 'Installing Anaconda 2-4.0.0'
# #wget -q http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh -P /tmp
# #bash Anaconda2-4.0.0-Linux-x86_64.sh
# #conda create --name py27conda2_3_0 python=2.7 anaconda=2.3.0
# #source activate py27conda2_3_0

# #Install PIP
# # echo 'Install PIP'
# # sudo apt-get -f install python-pip -y

# #Install Flask Excel
# #echo 'Install Flask Excel'
# #pip install Flask-Excel
# #pip install pyexcel-xlsx

# # Install Python 3.6
# sudo add-apt-repository ppa:jonathonf/python-3.6  # (only for 16.04 LTS)
# sudo apt update
# sudo apt install python3.6
# sudo apt install python3.6-dev
# sudo apt install python3.6-venv
# wget https://bootstrap.pypa.io/get-pip.py
# sudo python3.6 get-pip.py
# sudo ln -s /usr/bin/python3.6 /usr/local/bin/python3
# sudo ln -s /usr/local/bin/pip /usr/local/bin/pip3
# python --version   # (this will reflect your choice, see above)
# python3 --version
# $(head -1 `which pip` | tail -c +3) --version
# $(head -1 `which pip3` | tail -c +3) --version


# # gradle
# wget -O ~/gradle-4.2.1-bin.zip https://services.gradle.org/distributions/gradle-4.2.1-bin.zip
# sudo apt-get install unzip
# sudo mkdir /opt/gradle
# sudo unzip -d /opt/gradle ~/gradle-4.2.1-bin.zip
# sudo rm ~/gradle-4.2.1-bin.zip


# # sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" >> ~/.bashrc
# # sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" >> ~/.zshrc
# # sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
# # sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.zshrc
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
# export PATH=$JAVA_HOME/bin:$PATH
# sudo echo "export PATH=\$PATH:/opt/gradle/gradle-4.2.1/bin" >> ~/.bashrc
# sudo echo "export PATH=\$PATH:/opt/gradle/gradle-4.2.1/bin" >> ~/.zshrc

# source ~/.bashrc
# source ~/.zshrc
# gradle -v


# # Change ownership
# sudo chown -hR vagrant:vagrant ~/Development
# sudo chown -hR vagrant:vagrant ~
