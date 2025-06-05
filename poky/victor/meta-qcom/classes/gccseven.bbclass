CC = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-gcc"
CXX = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-g++"
LD = "${WORKSPACE}/old-toolchain/arm/bin/arm-linux-gnueabi-ld"

python __anonymous() {
    import shlex

    cf  = d.getVar('CFLAGS', True)   or ""
    cxx = d.getVar('CXXFLAGS', True) or ""
    ld  = d.getVar('LDFLAGS', True)   or ""

    bad_cf  = []
    bad_cxx = []
    bad_ld  = []
    for tok in shlex.split(cf):
        if tok.startswith("-fcanon-prefix-map")  \
        or tok.startswith("-fmacro-prefix-map") \
        or tok.startswith("-fdebug-prefix-map") \
        or tok.startswith("-ffile-prefix-map"):
            bad_cf.append(tok)
    for tok in shlex.split(cxx):
        if tok.startswith("-fcanon-prefix-map")  \
        or tok.startswith("-fmacro-prefix-map") \
        or tok.startswith("-fdebug-prefix-map") \
        or tok.startswith("-ffile-prefix-map"):
            bad_cxx.append(tok)
    for tok in shlex.split(ld):
        if tok.startswith("-fcanon-prefix-map")  \
        or tok.startswith("-fmacro-prefix-map") \
        or tok.startswith("-fdebug-prefix-map") \
        or tok.startswith("-ffile-prefix-map"):
            bad_ld.append(tok)

    if bad_cf:
        d.setVar('CFLAGS:remove', " ".join(bad_cf))
    if bad_cxx:
        d.setVar('CXXFLAGS:remove', " ".join(bad_cxx))
    if bad_ld:
        d.setVar('LDFLAGS:remove', " ".join(bad_ld))
}

CFLAGS:prepend = " --sysroot=${STAGING_LIBDIR}/../.. "
CXXFLAGS:prepend = " --sysroot=${STAGING_LIBDIR}/../.. "
LDFLAGS:prepend = " --sysroot=${STAGING_LIBDIR}/../.. "

INSANE_SKIP:${PN} += "32bit-time"
INSANE_SKIP:${PN} += "rpaths"
INSANE_SKIP:${PN} += "ldflags"