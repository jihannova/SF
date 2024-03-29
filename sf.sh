#!/bin/bash

send_maple () {
cd ~/rom/out/target/product/maple


maple_dsds=Nusantara-v5.5-13-maple_dsds-OFFICIAL-15022023-0233.zip
maple_dsds_gapps=Nusantara-v5.5-13-maple_dsds-Gapps-OFFICIAL-15022023-0403.zip
maple=Nusantara-v5.5-13-maple-OFFICIAL-15022023-0516.zip
maple_gapps=Nusantara-v5.5-13-maple-Gapps-OFFICIAL-15022023-0436.zip
project=nusantaraproject/maple  

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"$SF_PASS\r\"
set timeout -1
expect \"sftp>\"
send \"put $maple\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"put $maple_gapps\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"cd ../maple_dsds\r\"
expect \"sftp>\"
send \"put $maple_dsds\r\"
expect \"Uploading\"
expect \"100%\"
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