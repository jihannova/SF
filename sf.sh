#!/bin/bash

send_maple () {
cd ~/rom/out/target/product/maple

#maple_dsds=Nusantara-v5.4-13-maple_dsds-13012023-OFFICIAL-1610.zip
maple_dsds_gapps=Cherish-OS-v4.5-20230213-0440-maple_dsds-UNOFFICIAL-GApps.zip
#maple=Nusantara-v5.4-13-maple-14012023-OFFICIAL-0219.zip 
maple_gapps=Cherish-OS-v4.5-20230213-0601-maple-UNOFFICIAL-GApps.zip
project=xperia-xz-premium/CherishOS/tiramisu/maple  

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"$SF_PASS\r\"
set timeout -1
expect \"sftp>\"
send \"put $maple_gapps\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"cd ../maple_dsds\r\"
expect \"sftp>\"
send \"put $maple_dsds_gapps\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"
}

#send_maple_dsds
send_maple
rm -rf ~/rom