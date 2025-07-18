#!/usr/bin/env bash

# Only to be used by Viccyware developers intending to copy OTAs to the OTA server

clear

read -p "Enter build increment: " inc
export INCREMENT="$inc"

read -p "Enter path to server root key (required): " keypath
export KEY_PATH="$keypath"

read -p "Enter OSKR bootloader password: " oskrpass
export OSKR_PASSWORD="$oskrpass"

echo "Building Dev OTA with version 0.6.0.$INCREMENT"
AUTO_UPDATE=1 ./build/build.sh -bt dev -v "$INCREMENT" -au

echo "Building OSKR OTA with version 0.6.0.$INCREMENT"
AUTO_UPDATE=1 ./build/build.sh -bt oskr -bp "$OSKR_PASSWORD" -v "$INCREMENT" -au

echo Remove old latest file
ssh -i "$KEY_PATH" root@froggitti.net 'rm /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/latest'

echo Make new latest file
ssh -i "$KEY_PATH" root@froggitti.net 'touch /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/latest'

echo Echo new version number to new latest file
ssh -i "$KEY_PATH" root@froggitti.net "echo 0.6.0.$INCREMENT /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/latest"

echo Copy Dev OTA
scp -i "$KEY_PATH" _build/0.6.0."$INCREMENT"d.ota root@froggitti.net:/home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/dev/0.6.0."$INCREMENT".ota

echo Copy OSKR OTA
scp -i "$KEY_PATH" _build/0.6.0."$INCREMENT"oskr.ota root@froggitti.net:/home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/oskr/0.6.0."$INCREMENT".ota

echo Copy Dev OTA to a never-changing URL
ssh -i "$KEY_PATH" root@froggitti.net "cp /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/dev/0.6.0."$INCREMENT".ota /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/latest/dev.ota"

echo Copy OSKR OTA to a never-changing URL
ssh -i "$KEY_PATH" root@froggitti.net "cp /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/oskr/0.6.0."$INCREMENT".ota /home/cozmo/Desktop/all_servers/Viccyware-ota-server/vicw/otas/full/latest/oskr.ota"


