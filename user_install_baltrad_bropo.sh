#!/usr/bin/env bash
set -x

# Vagrant provision script for installing Baltrad bropo component
export PATH="/home/vagrant/miniconda/bin:$PATH"

# dependencies
sudo apt-get install -qq libpng12-dev
export LD_LIBRARY_PATH=/home/vagrant/miniconda/lib:/opt/baltrad/hlhdf/lib:/opt/baltrad/rave/lib

# install bropo from source
cd ~
cd tmp
git clone --depth 1 git://git.baltrad.eu/bropo.git
cd bropo/
./configure --prefix=/opt/baltrad/bropo
make
make test
sudo make install
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/opt/baltrad/bropo/lib\"" >> ~/.bashrc
