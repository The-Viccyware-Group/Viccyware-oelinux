# Viccyware-oelinux

The main repo for building Viccyware otas.

## Submodules

- /poky/poky -> [yoctoproject/poky](https://github.com/yoctoproject/poky) (walnascar)
- /poky/meta-openembedded -> [openembedded/meta-openembedded](https://github.com/openembedded/meta-openembedded) (walnascar)
- /anki/victor -> [Viccyware](https://github.com/Switch-modder/Viccyware) (Viccyware-tester)
- /anki/wired -> [wired](https://github.com/os-vector/wired) (main)

## Update notes:

- **05-20-2025**: you might want to run `./build/clean.sh "connman wpa-supplicant base-files systemd tzdata"` before building again

## Build

- Note: you will need a somewhat beefy **x86_64 Linux** machine with at least 16GB of RAM and 100GB of free space.

1. [Install Docker](https://docs.docker.com/engine/install/), git, and wget.

2. Configure it so a regular user can use it:

```
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock
```

3. Clone and build:

```
git clone https://github.com/The-Viccyware-Group/Viccyware-oelinux/ --recurse-submodules
cd Viccyware-oelinux
./build/build.sh -bt <dev/oskr> -bp <boot-passwd> -v <build-increment>
# boot password not required for dev
# example: ./build/build.sh -bt dev -v 1
```

### Where is my OTA?

`./_build/3.0.1.1.ota`

## Differences compared to normal Vector FW

-   New OS base
    -   Yocto Walnascar rather than Jethro
        -   glibc 2.41 (latest as of 04-2025)
-   `victor` software compiled with Clang 18.1.8 rather than 5.0.1
-   Rainbow eye color
    -   Can be activated in :8888/demo.html
-   Some Anki-era PRs have been merged
    -   Performances
        -   He will somewhat randomly do loosepixel and binaryeyes
    -   Better camera gamma correction
        -   He handles too-bright situations much better now
-   Snowboy wakeword engine
    -   Custom wake words!
-   `htop` and `rsync` are embedded
-   Python 3.13 rather than Python 2
-   Fixed fault code handler
    - No more 980 or 981 after crash on Vector 2.0
-   Global SSH key ([ssh_root_key](https://raw.githubusercontent.com/kercre123/unlocking-vector/refs/heads/main/ssh_root_key))

## What isn't there yet

- delta updates
- iptables
- r/o rootfs (due to time zone setting. Anki's /data/etc/localtime patch didn't work)

## Viccyware was made possible though the work of some amazing community members

- [Wire](https://github.com/kercre123)
- [Yrekcaz](https://github.com/Yrekcaz)
- [Froggitti](https://github.com/froggitti)
- [ThommoMC](https://github.com/ThommoMC)
- [Gaming Time](https://github.com/gamingtimevr)
- [Raj-jyot Deol / Switch_modder](https://github.com/Switch-modder)
