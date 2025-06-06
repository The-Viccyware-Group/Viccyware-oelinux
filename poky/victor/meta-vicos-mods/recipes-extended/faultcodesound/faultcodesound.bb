SUMMARY = "XP error for fault code handler"
DESCRIPTION = "Puts xp error.wav file in /bin"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://xp-error.wav"

do_install() {
    install -d ${D}${bindir}
    install -m 0644 ${UNPACKDIR}/xp-error.wav ${D}${bindir}/
}

FILES:${PN} = "${bindir}/xp-error.wav"
