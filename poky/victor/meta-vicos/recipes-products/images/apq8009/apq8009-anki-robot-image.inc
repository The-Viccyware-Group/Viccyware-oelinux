#
# Include the robot settings
#
IMAGE_INSTALL += "cryptsetup"
#IMAGE_INSTALL += "user-data-locker"
IMAGE_INSTALL += "vic-christen"
IMAGE_INSTALL += "nano"
IMAGE_INSTALL += "openssl"
IMAGE_INSTALL += "libatomic"
IMAGE_INSTALL += "libdevmapper"
IMAGE_INSTALL += "libsamplerate0"
IMAGE_INSTALL += "libsndfile1"
IMAGE_INSTALL += "lvm2"
IMAGE_INSTALL += "chrony"

IMAGE_INSTALL += "iptables-persistent"
IMAGE_INSTALL += "ip6tables-persistent"

#IMAGE_INSTALL += "rng-tools"

IMAGE_INSTALL += "alsa-utils"
IMAGE_INSTALL += "dhcpcd"
IMAGE_INSTALL += "openssl-bin"
#IMAGE_INSTALL += "wiretestprog"
IMAGE_INSTALL += "emr-cat"
IMAGE_INSTALL += "wpa-supplicant"
IMAGE_INSTALL += "prop-qti"
IMAGE_INSTALL += "update-engine"
IMAGE_INSTALL += "bash"
IMAGE_INSTALL += "python3"
IMAGE_INSTALL += "libgomp"

IMAGE_INSTALL += "libunwind"
IMAGE_INSTALL += "liburcu"

# dev-only things
IMAGE_INSTALL += "${@oe.utils.conditional('USER_BUILD', '1', '', 'rsync', d)}"
IMAGE_INSTALL += "${@oe.utils.conditional('USER_BUILD', '1', '', 'htop', d)}"

#IMAGE_INSTALL += "docker"

IMAGE_INSTALL += "syslog-ng"
IMAGE_INSTALL += "logrotate"
IMAGE_INSTALL += "connman"
IMAGE_INSTALL += "connman-client"
#IMAGE_INSTALL += "kernel-module-ramoops"
#IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES','avahi', 'avahi-daemon', '', d)}"
