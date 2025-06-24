#!/bin/bash

clear

echo pulling latest dev-cdn 

cd anki/victor

git checkout -b frog/cdn-dev

git pull origin frog/cdn-dev

cd ../../

read -p "enter build increment: " inc
export INCREMENT="$inc"

read -p "enter path for server key: " path
export SERVER_KEY_PATH="$path"

I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt dev -v "$INCREMENT" -au
I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt oskr -bp annul-burl-zq-flew-hack-owe-phil-triton-pk -v "$INCREMENT" -au

scp -v -i "$SERVER_KEY_PATH" "_build/Viccyware-0.5.0.${INCREMENT}oskr.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/oskr/0.5.0."${INCREMENT}".ota

I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt prod -s -op alike-essay-added-spumoni-lotion -bp require-radiolog-sprinkle-slither-genetics -v "$INCREMENT" -au

echo "OSKR build already copied, copying dev and prod builds to the server now..."

scp -v -i "$SERVER_KEY_PATH" "_build/Viccyware-0.5.0.${INCREMENT}d.ota" "root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/dev/0.5.0.${INCREMENT}".ota

# commented out cause prod builds are building with the "oskr" extension, so we need to SCP the oskr build to the server as soon as its done building
#scp -i "$SERVER_KEY_PATH" "_build/Viccyware-0.5.0.${INCREMENT}oskr.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/oskr/0.5.0."${INCREMENT}".ota

# this is a prod build
scp -v -i "$SERVER_KEY_PATH" "_build/Viccyware-0.5.0.${INCREMENT}oskr.ota" "root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/prod/0.5.0.${INCREMENT}".ota

# leave these commented unless we want to start copying otas to a never-changing URL
#scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/Viccyware-0.5.0.${INCREMENT}d.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/latest/dev.ota
#scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/Viccyware-0.5.0.${INCREMENT}oskr.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/latest/oskr.ota
