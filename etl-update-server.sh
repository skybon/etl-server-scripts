#!/bin/bash
sudo echo "sudo granted..."
cd etlegacy-git/src/etlegacy && git pull && cd ../../..
cd etlegacy-mod-win32-git/src/etlegacy && git pull && cd ../../..
wget https://aur.archlinux.org/packages/et/etlegacy-git/etlegacy-git.tar.gz && tar -xvf etlegacy-git.tar.gz
wget https://aur.archlinux.org/packages/et/etlegacy-mod-win32-git/etlegacy-mod-win32-git.tar.gz && tar -xvf etlegacy-mod-win32-git.tar.gz
cd etlegacy-git && makepkg -si --noconfirm && cd ..
cd etlegacy-mod-win32-git && makepkg -si --noconfirm && cd ..
