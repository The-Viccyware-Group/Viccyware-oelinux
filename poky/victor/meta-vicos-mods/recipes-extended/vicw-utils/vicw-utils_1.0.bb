SUMMARY = "Viccyware utilities"
DESCRIPTION = "Something to manage Viccyware specific things (Only volume for now because idk what else it needs now)"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI = "file://vicw-utils.sh"

do_unpack[noexec] = "1"
do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${UNPACKDIR}/vicw-utils.sh ${D}${bindir}/vicw-utils
}

FILES:${PN} = "${bindir}/vicw-utils"
RDEPENDS:${PN} = "bash"
