#!/bin/bash
## Mac env setting
## Author: Leon.Lin    2020.03.08

YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m' # No Color
printf "${YELLOW}Enter passwd for installing Mac_env_setting${NO_COLOR}\n"
read -s PASSWD
printf "PASSWD: ${RED}$PASSWD${NO_COLOR}\n"

printf "${YELLOW}Import terminal theme setting${NO_COLOR}\n"
> ~/.bash_profile
cat terminal_theme_setting.txt >> ~/.bash_profile

printf "${YELLOW}open remote login for scp${NO_COLOR}\n"
echo "$PASSWD" | sudo -S systemsetup -getremotelogin

printf "${YELLOW}Install Homebrew${NO_COLOR}\n"
echo "/n" |/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

printf "${YELLOW}Install Necessary library${NO_COLOR}\n"
brew install pkg-config
brew install git
brew install cmake
brew install libomp
brew install boost boost-python sdl2 swig wget
brew install gdb
wget -P ~ https://git.io/.gdbinit # enabling gdb extension: gdb-dashboard

printf "${YELLOW}Install python3 and related libs${NO_COLOR}\n"
brew install python3
pip3 install numpy
pip3 install scipy
pip3 install sklearn
pip3 install matplotlib
pip3 install pandas
pip3 install seaborn
pip3 install ipython 

printf "${YELLOW}Install Eigen${NO_COLOR}\n"
brew install eigen

printf "${YELLOW}Install vscode${NO_COLOR}\n"
brew cask install visual-studio-code
sudo spctl --master-disable




printf "${YELLOW}Install opencv${NO_COLOR}\n"
brew install ffmpeg # for playing .avi using opencv
brew install gtk+   # sudo apt install libgtk2.0-dev and pkg-config on ubuntu 
cd ~/
mkdir opencv && cd opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd ~/opencv/opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib/modules/ ..
make -j7
make install


printf "${YELLOW}Enter usermail for generating ssh key${NO_COLOR}\n"
read -s usermail
printf "usermail: ${RED}$usermail${NO_COLOR}\n"
ssh-keygen -t rsa -b 4096 -C "${usermail}" 
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa





#install julia
# brew cask install julia


# #installVTK and PCL
# cd /usr/local/Cellar
# git clone -b v8.2.0 https://github.com/Kitware/VTK/tree/v8.2.0
# cd VTK
# mkdir build && cd build
# cmake ..
# make -j4
# sudo make install

# cd /usr/local/Cellar
# git clone -b pcl-1.9.1 https://github.com/PointCloudLibrary/pcl/tree/pcl-1.9.1
# cd pcl
# mkdir build && cd build
# cmake ..
# make -j4
# sudo make install


# # for TUDARMSTADT_CV2_asgn 
# 1) Install Anaconda3.

#     Instructions: https://www.anaconda.com/distribution
#     Note: Use Python3 version.

# 3) Install PyTorch
#     Instructions: https://pytorch.org/get-started/locally/

#     Linux:   $conda install pytorch-cpu torchvision-cpu -c pytorch
#     MaxOS:   $conda install pytorch torchvision -c pytorch
#     Windows: $conda install pytorch-cpu torchvision-cpu -c pytorch

# #install package under Anaconda3
# pip install -t /Users/linchingyu/anaconda3/lib/python3.7/site-packages package_name


# # Install PyMaxFlow
# pip install -t /Users/linchingyu/anaconda3/lib/python3.7/site-packages PyMaxFlow

#  # Install cvxopt
# pip install -t /Users/linchingyu/anaconda3/lib/python3.7/site-packages cvxopt

#  Install tqdm
# pip install -t /Users/linchingyu/anaconda3/lib/python3.7/site-packages tqdm

