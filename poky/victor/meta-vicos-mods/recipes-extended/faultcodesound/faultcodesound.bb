SUMMARY = "XP error for fault code handler"
DESCRIPTION = "Puts ep error.wav file in /bin"
LICENSE = "CLOSED"

SRC_URI = "file://xp-error.wav"

do_install() {
    install -d ${D}${bindir}
    install -m 0644 ${WORKDIR}/xp-error.wav ${D}${bindir}/
}

FILES:${PN} = "${bindir}/xp-error.wav"
