#! /bin/bash
#
# Script to build SVX 17.12.2 on Raspberry Pi
#
# For Ridgeway Repeater Group
#
# Author: Andy Gittings
#
# Email: m1efy@outlook.com
#

echo "Downloading archives..."

wget https://github.com/sm0svx/svxlink/archive/17.12.2.tar.gz
wget https://www.george-smart.co.uk/wordpress/wp-content/uploads/bin/Sounds-en_GB-rachel-13.03.tar.bz2

# Ensure repo is up-to-date so we can find all relevant packages.
#
sudo apt-get update
#
# Install the pre-requisites...
#
sudo apt-get -y install libsigc++-2.0-dev g++ make libsigc++-1.2-dev libgsm1-dev \
libpopt-dev tcl8.5-dev libgcrypt-dev libspeex-dev libasound2-dev alsa-utils cmake \
doxygen build-essential groff

#
# Create the svxlink user and add them to the daemon group...
#
sudo adduser --disabled-password --gecos "" svxlink
sudo adduser svxlink daemon


#
#
# Create build folder and run cmake with sensible options for the pi
#
tar xvzf 17.12.2.tar.gz

cd svxlink-17.12.2/src
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DUSE_QT=no ..

#
#
# Install...

make
make doc
sudo make install
sudo ldconfig

#
#
# Build config files..
sudo svxlink --config /etc/svxlink/svxlink.conf

#modify first the /etc/svxlink/svxlink.conf and similar conf files

sudo svxlink --config /etc/svxlink/svxlink.conf
make
make docs
make install


