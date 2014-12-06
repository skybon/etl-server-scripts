#!/bin/bash
#Install ET:Legacy
./etl-update-server.sh

#Deploy default configuration
mkdir etl-addons
sudo cp -f -t etl-addons /etc/xdg/etlegacy/etmain/etl_server.cfg /etc/xdg/etlegacy/etmain/legacy.cfg
cd etl-addons
sudo nano etl_server.cfg legacy.cfg
wget http://regex.info/code/JSON.lua -O JSON.lua
git clone https://github.com/Zelly/ZellyLuas.git
sudo cp -f -t /usr/lib/etlegacy/legacy ZellyLuas/ZXpSave.lua JSON.lua
sudo cp -f -t /etc/xdg/etlegacy/etmain etl_server.cfg legacy.cfg
cd ..

# Server start
sudo systemctl daemon-reload
sudo systemctl start etlegacy

#Cleanup
./etl-deploy-cleanup.sh
