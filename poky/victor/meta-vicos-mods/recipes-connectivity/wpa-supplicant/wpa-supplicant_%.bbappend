FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://disable-sae.conf"

do_install:append() {
    cat ${UNPACKDIR}/disable-sae.conf \
        >> ${D}${sysconfdir}/wpa_supplicant.conf
}
