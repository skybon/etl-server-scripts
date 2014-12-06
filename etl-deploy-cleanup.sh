#!/bin/bash
rm -rf etlegacy-git/*.pkg.tar.xz etlegacy-mod-win32-git/*.pkg.tar.xz
rm -rf etlegacy-git.tar.gz etlegacy-mod-win32-git.tar.gz
cd etlegacy-git/src/etlegacy && git clean -df && git gc --aggressive && cd ../../..
cd etlegacy-mod-win32-git/src/etlegacy && git clean -df && git gc --aggressive && cd ../../..
