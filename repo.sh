#!/bin/bash
    
sync () {
    cd ~/rom
    repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest.git -b twelve-one -g default,-mips,-darwin,-notdefault
    git clone https://github.com/ariffjenong/local_manifest.git --depth=1 -b cherish-12.1 .repo/local_manifests
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j24 device/sony/maple_dsds
}

compile () {
    sync
    echo "done."
}

cd ~/rom
ls -lh
compile

# Lets see machine specifications and environments
df -h
free -h
nproc
cat /etc/os*
