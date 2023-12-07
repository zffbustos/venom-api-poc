#!/bin/bash

os_dist="darwin-arm64"
installation_path="/usr/local/bin/venom"
git clone git@github.com:riskive/venom.git
cd venom
make clean
make build
sudo cp -rf "dist/venom.$os_dist" $installation_path
if [ $(ls -1 $installation_path | wc -l) -eq 1 ]
then
    echo "Venom has been installed successfully"
else
    echo "Problem with venom installation, try manually"
fi
exit 0