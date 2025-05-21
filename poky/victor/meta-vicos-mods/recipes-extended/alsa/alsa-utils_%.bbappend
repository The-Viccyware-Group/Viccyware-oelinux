CC = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-gcc --sysroot=${WORKSPACE}/poky/build/tmp-glibc/work/armv7a-neon-vfpv4-oe-linux-gnueabi/${PN}/${PV}/recipe-sysroot"
CXX = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-g++ --sysroot=${WORKSPACE}/poky/build/tmp-glibc/work/armv7a-neon-vfpv4-oe-linux-gnueabi/${PN}/${PV}/recipe-sysroot"
LD = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-ld"

do_configure:prepend () {
    export CFLAGS="$(echo $LDFLAGS | sed 's/-fcanon-prefix-map=[^ ]*//g' | sed 's/-fcanon-prefix-map//g' | sed 's/-fmacro-prefix-map=[^ ]*//g' | sed 's/-fdebug-prefix-map=[^ ]*//g' | sed 's/-ffile-prefix-map=[^ ]*//g')"
    export CXXFLAGS="$(echo $LDFLAGS | sed 's/-fcanon-prefix-map=[^ ]*//g' | sed 's/-fcanon-prefix-map//g' | sed 's/-fmacro-prefix-map=[^ ]*//g' | sed 's/-fdebug-prefix-map=[^ ]*//g' | sed 's/-ffile-prefix-map=[^ ]*//g')"
    export LDFLAGS="$(echo $LDFLAGS | sed 's/-fcanon-prefix-map=[^ ]*//g' | sed 's/-fcanon-prefix-map//g' | sed 's/-fmacro-prefix-map=[^ ]*//g' | sed 's/-fdebug-prefix-map=[^ ]*//g' | sed 's/-ffile-prefix-map=[^ ]*//g')"
}

INSANE_SKIP:${PN} += "32bit-time"
