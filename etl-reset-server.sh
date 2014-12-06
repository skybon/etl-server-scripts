#!/bin/bash
./etl-update-server.sh

# FTP Upload
sudo rm -rf /srv/ftp/legacy/* && sudo cp -t /srv/ftp/legacy /usr/lib/etlegacy/legacy/*.pk3

# CFG Update
cd etl-addons
cd ZellyLuas && git pull && cd ..
curl -O http://regex.info/code/JSON.lua
sudo cp -f -t /etc/xdg/etlegacy/etmain etl_server.cfg legacy.cfg
sudo cp -f -t /usr/lib/etlegacy/legacy ZellyLuas/ZXpSave.lua JSON.lua
cd ..

# Server restart
sudo systemctl daemon-reload
sudo systemctl restart etlegacy

# Cleanup
./etl-deploy-cleanup.sh
