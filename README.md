# rrg-svxlink

To build and install svxlink on Raspberry Pi

Install Raspian Stretch Lite (https://www.raspberrypi.org/downloads/raspbian/) onto Pi 

First ensure you have GIT installed...
```
sudo apt-get update
sudo apt-get -y git
```
Then download this GIT repository (assuming you are logged in as user "pi")...
```
cd ~/
git clone https://github.com/m1efy/rrg-svxlink.git
```
Execute the shell script to run the build...
```
cd rrg-svxlink
sudo sh build-svxlink.sh
```
Wait while the script downloads the packages and performs the build and installation.

The final configuration of svxlink will depend upon the chosen method of connection to the repeater. 
