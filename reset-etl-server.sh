#!/bin/bash
sudo echo "sudo granted..."
cd etlegacy-git/src/etlegacy && git pull && cd ../../..
cd etlegacy-mod-win32-git/src/etlegacy && git pull && cd ../../..
wget https://aur.archlinux.org/packages/et/etlegacy-git/etlegacy-git.tar.gz && tar -xvf etlegacy-git.tar.gz
wget https://aur.archlinux.org/packages/et/etlegacy-mod-win32-git/etlegacy-mod-win32-git.tar.gz && tar -xvf etlegacy-mod-win32-git.tar.gz
cd etlegacy-git && makepkg -si --noconfirm && cd ..
cd etlegacy-mod-win32-git && makepkg -si --noconfirm && cd ..

# ЗАГРУЗКА НА FTP
sudo rm -rf /srv/ftp/legacy/* && sudo cp -t /srv/ftp/legacy /usr/lib/etlegacy/legacy/*.pk3

# ОБНОВЛЕНИЕ КОНФИГОВ
cd etl-addons
cd ZellyLuas && git pull && cd ..
wget http://regex.info/code/JSON.lua -O JSON.lua
sudo cp -f -t /etc/xdg/etlegacy/etmain etl_server.cfg legacy.cfg
sudo cp -f -t /usr/lib/etlegacy/legacy ZellyLuas/ZXpSave.lua JSON.lua
cd ..

# ПЕРЕЗАПУСК СЕРВЕРА
sudo systemctl daemon-reload
sudo systemctl restart etlegacy

# ОЧИСТКА
rm -rf etlegacy-git/*.pkg.tar.xz etlegacy-mod-win32-git/*.pkg.tar.xz
rm -rf etlegacy-git.tar.gz etlegacy-mod-win32-git.tar.gz
cd etlegacy-git/src/etlegacy && git clean -df && git gc --aggressive && cd ../../..
cd etlegacy-mod-win32-git/src/etlegacy && git clean -df && git gc --aggressive && cd ../../..
