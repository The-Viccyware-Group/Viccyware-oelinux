SUMMARY = "TAM boot chime for veccr"
DESCRIPTION = "Boot chime, file located in /bin"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://tam-boot-chime.wav"

do_unpack[noexec] = "1"
do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -d ${D}${bindir}
    install -m 0644 ${UNPACKDIR}/tam-boot-chime.wav ${D}${bindir}/
}

FILES:${PN} = "${bindir}/tam-boot-chime.wav"
