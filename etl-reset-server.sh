#!/bin/bash

sudo systemctl stop etlegacy
sudo rm -rf /usr/lib/etlegacy/etmain/*.pk3 /usr/lib/etlegacy/legacy/*.pk3

./etl-update-server.sh

# FTP Upload
sudo rm -rf /srv/ftp/legacy/* && sudo cp -t /srv/ftp/legacy /usr/lib/etlegacy/legacy/*.pk3

# CFG Update
cd etl-addons

cd ZellyLuas && git pull && cd .. && curl -O http://regex.info/code/JSON.lua

sudo cp -f -t /etc/xdg/etlegacy/etmain etl_server.cfg legacy.cfg mapvotecycle.cfg
sudo cp -f -t /usr/lib/etlegacy/legacy/omni-bot/et/user omni-bot.cfg
sudo cp -f -t /usr/lib/etlegacy/legacy ZellyLuas/ZXpSave.lua JSON.lua
sudo cp -t /srv/ftp/legacy pk3/* && sudo cp -t /usr/lib/etlegacy/etmain pk3/*

cd ..

# Server restart
sudo systemctl daemon-reload
sudo systemctl restart etlegacy

# Cleanup
./etl-deploy-cleanup.sh
