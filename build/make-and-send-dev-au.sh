#!/bin/bash

clear

echo "Ensure you have a good copy of the server's root key placed in your home directory. Starting in 5 seconds..."

sleep 5s

clear

read -p "enter build increment: " inc
export INCREMENT="$inc"

I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt dev -v "$INCREMENT" -au
I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt oskr -bp annul-burl-zq-flew-hack-owe-phil-triton-pk -v "$INCREMENT" -au
I_AM_THE_CREATOR_AND_WANT_TO_MAKE_THE_BUILD_AUTO_UPDATE=1 ./build/build.sh -bt prod -s -op alike-essay-added-spumoni-lotion -bp annul-burl-zq-flew-hack-owe-phil-triton-pk -v "$INCREMENT" -au

scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/vicos-0.5.0.${INCREMENT}d.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/dev/0.5.0."${INCREMENT}".ota
scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/vicos-0.5.0.${INCREMENT}oskr.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/oskr/0.5.0."${INCREMENT}".ota
scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/vicos-0.5.0.${INCREMENT}.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/prod/0.5.0."${INCREMENT}".ota

# leave these commented unless we want to start copying otas to a never-changing URL
#scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/vicos-0.5.0.${INCREMENT}d.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/latest/dev.ota
#scp -i ~/id_rsa_ROOT_COZMOSERVER "_build/vicos-0.5.0.${INCREMENT}oskr.ota" root@froggitti.xyz:/home/cozmo/Desktop/all_servers/Viccyware-ota-server-dev/vicw-dev/otas/full/latest/oskr.ota