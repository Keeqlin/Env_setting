#!/bin/bash
## Ubuntu 18.04 setting for GW
## Author: Leon.Lin    2019.11.26
## Modified: Kai.Chen   2019.12.12

# User account and password input
read -sp "Please enter your sudo password: " password
echo 

# apt and apt-get update/upgrade
echo -e $password | sudo -S apt-get -y update
echo -e $password | sudo -S apt-get -y upgrade
echo -e $password | sudo -S apt -y update
echo -e $password | sudo -S apt -y upgrade

# cmake update
echo -e $password | sudo -S apt -y autoremove cmake
echo -e $password | sudo -SE add-apt-repository ppa:george-edison55/cmake-3.x
echo -e $password | sudo -SE apt -y update
echo -e $password | sudo -SE apt -y install cmake

# Install vim, git, rar, unrar, htop, screen, unzip, gnome-tweak-tool
echo -e $password | sudo -S apt -y install vim git rar unrar htop screen unzip gnome-tweak-tool

# Install Chinese spelling
echo -e $password | sudo -S apt -y install hime
## Further setting after install
# https://blog.goodjack.tw/2013/08/linux-phonetic-setting.html

# Install Slack
echo -e $password | sudo -S snap install slack --classic

# Install vlc
echo -e $password | sudo -S snap install vlc --classic

# eigen3
echo -e $password | sudo -S apt -y install libeigen3-dev

# ssh
echo -e $password | sudo -S apt -y install openssh-server
ssh-keygen -t rsa -b 4096 -C "leonlin@gallopwave.com"

# Python3
echo -e $password | sudo -S apt install -y python3-pip python3-dev
echo -e $password | sudo -S apt -y install build-essential pkg-config libopenblas-dev liblapack-dev
# Numpy, scipy, pandas, matplotlib
echo -e $password | sudo -S pip3 install numpy scipy pandas matplotlib



# OpenCV
echo -e $password | sudo -S apt -y install libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev pkg-config
echo -e $password | sudo -SE add-apt-repository “deb http://security.ubuntu.com/ubuntu xenial-security main”
echo -e $password | sudo -S apt -y update
echo -e $password | sudo -S apt -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cd ~/
mkdir ~/opencv
cd ~/opencv
git clone -b https://github.com/opencv/opencv.git
git clone -b https://github.com/opencv/opencv_contrib.git
cd ~/opencv
mkdir ~/opencv/build
cd ~/opencv/build
export OpenCV_DIR=~/opencv
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib/modules/ ../opencv
make -j7 
echo -e $password | sudo -S make install


# PCL
cd ~/
git clone https://github.com/PointCloudLibrary/pcl.git

echo -e $password | sudo -S apt-get -y update  
echo -e $password | sudo -S apt-get -y install git build-essential linux-libc-dev  
echo -e $password | sudo -S apt-get -y install cmake
echo -e $password | sudo -S apt-get -y install libusb-1.0-0-dev libusb-dev libudev-dev  
echo -e $password | sudo -S apt-get -y install mpi-default-dev openmpi-bin openmpi-common    
echo -e $password | sudo -S apt-get -y install libflann1.8 libflann-dev  
echo -e $password | sudo -S apt-get -y install libeigen3-dev  
echo -e $password | sudo -S apt-get -y install libboost-all-dev  
echo -e $password | sudo -S apt-get -y install libvtk5.10-qt4 libvtk5.10 libvtk5-dev  
echo -e $password | sudo -S apt-get -y install libqhull* libgtest-dev  
echo -e $password | sudo -S apt-get -y install freeglut3-dev pkg-config  
echo -e $password | sudo -S apt-get -y install libxmu-dev libxi-dev   
echo -e $password | sudo -S apt-get -y install mono-complete  
echo -e $password | sudo -S apt-get -y install qt-sdk openjdk-8-jdk openjdk-8-jre  
cd ~/pcl
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
           -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON \
           -DCMAKE_INSTALL_PREFIX=/usr ..
make -j8  
sudo make install 
cd ~/


# TensorFlow
echo -e $password | sudo -S pip3 install --upgrade tensorflow

# # Dropbox
echo -e $password | sudo -S apt -y install nautilus-dropbox
nautilus --quit
dropbox update
# dropbox start

# # Kazam
echo -e $password | sudo -S add-apt-repository ppa:sylvain-pineau/kazam
echo -e $password | sudo -S apt -y install kazam
# dropbox start


# Remove the root password variable
unset $password

#OPENCV example testing
cd ~/opencv/opencv/samples/cpp/example_cmake/
mkdir -p build && cd build/
cmake ..
make
echo "***Press ESC to exit***"
./opencv_example
cd ./../
sudo rm -r build

#Ubuntu software manual installation
#VSCODE, Foxi reader 


# #graphicsmagick
# sudo apt-get update -y
# sudo apt-get install -y graphicsmagick
