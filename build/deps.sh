#!/bin/bash

set -e

if [[ ! -d poky ]]; then
	if [[ -d ../poky ]]; then
		cd ..
	else
		echo "run this in the correct directory"
		exit 1
	fi
fi

OD="$(pwd)"

if [[ -f old-toolchain/arm/gcc-linaro-4.9-2016.02-manifest.txt ]]; then
	echo "old 4.9 toolchain detected, replacing with 7.5 (this is used for kernel + some specific programs)"
	echo "ankibluetoothd bt-property common btvendorhal configdb dsutils diag fluoride hci-qcomm-init libbt-vendor libhardware qmi qmi-client-helper qmuxd qmi-framework time-genoff xmllib system-core libbase libunwindandroid libutils linux-msm" > wire-cleaning
fi

# if hf compiler, we want to replace with armel
if [[ ! -d old-toolchain/arm ]] || [[ -d old-toolchain/arm/arm-linux-gnueabihf ]] || [[ -f old-toolchain/arm/gcc-linaro-4.9-2016.02-manifest.txt ]]; then
	#if [[ -d old-toolchain ]]; then
	#	echo "as root because this was originally done in a docker container, so perms are messed up"
	rm -rf old-toolchain
	#fi
	mkdir -p old-toolchain
	cd old-toolchain
	wget -q --show-progress https://github.com/os-vector/wire-os-externals/releases/download/4.0.0-r05/armel-7.5.0.tar.gz
	tar -zxf armel-7.5.0.tar.gz
	rm armel-7.5.0.tar.gz
fi

cd "$OD"

if [[ ! -d anki-deps/vicos-sdk/dist/4.0.0-r05/prebuilt ]]; then
	if [[ -d anki-deps ]]; then
		sudo rm -rf anki-deps
	fi
	mkdir -p anki-deps/vicos-sdk/dist/4.0.0-r05
	cd anki-deps/vicos-sdk/dist/4.0.0-r05
	wget -q --show-progress https://github.com/os-vector/wire-os-externals/releases/download/4.0.0-r05/vicos-sdk_4.0.0-r05_x86_64-arm-oe-linux-gnueabi.tar.gz
	tar -zxvf vicos-sdk_4.0.0-r05_x86_64-arm-oe-linux-gnueabi.tar.gz
	rm -f vicos-sdk_4.0.0-r05_x86_64-arm-oe-linux-gnueabi.tar.gz
fi

cd "$OD"

if [[ ! -d anki-deps/wwise ]]; then
	mkdir -p anki-deps/wwise/versions/2017.2.7_a
	cd anki-deps/wwise/versions/2017.2.7_a
	wget -q --show-progress https://github.com/os-vector/wire-os-externals/releases/download/4.0.0-r05/wwise-2017.2.7_a.tar.gz
	tar -zxvf wwise-2017.2.7_a.tar.gz
	rm -f wwise-2017.2.7_a.tar.gz
fi

cd "$OD"
