SUMMARY = "Macintosh LC crash sound for fault code handler"
DESCRIPTION = "Puts LC-Crash.wav file in /bin"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://LC-Crash.wav"

do_install() {
    install -d ${D}${bindir}
    install -m 0644 ${UNPACKDIR}/LC-Crash.wav ${D}${bindir}/
}

FILES:${PN} = "${bindir}/LC-Crash.wav"
