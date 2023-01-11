#!/bin/bash

send_maple () {
cd ~/rom/out/target/product/maple


maple_dsds=Nusantara-v5*-13-maple_dsds-Gapps-*-OFFICIAL-*.zip
maple=Cherish-OS-v4.4-20230111-1006-maple-UNOFFICIAL-GApps.zip
project=xperia-xz-premium/CherishOS/tiramisu/maple

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"${SF_PASS}\r\"
set timeout -1
expect \"sftp>\"
send \"put $maple\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"
}

#send_maple_dsds
send_maple
rm -rf ~/rom