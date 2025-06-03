inherit autotools qcommon

DESCRIPTION = "encoders"
#LICENSE = "BSD"
#LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/\
#${LICENSE};md5=3775480a712fc46a69647678acb234cb"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/\
${LICENSE};md5=550794465ba0ec5312d6919e203a55f9"

PR = "r0"

SRC_DIR = "${WORKSPACE}/hardware/qcom/audio/mm-audio/"

S = "${WORKDIR}/hardware/qcom/audio/mm-audio/"
EXTRA_OECONF:append += "--with-sanitized-headers=${STAGING_KERNEL_BUILDDIR}/usr/include"
EXTRA_OECONF:append += "--with-glib"

DEPENDS = "media"

FILES:${PN}-dbg  = "${libdir}/.debug/*"
FILES:${PN}      = "${libdir}/*.so ${libdir}/*.so.* ${sysconfdir}/* ${bindir}/* ${libdir}/pkgconfig/*"
FILES:${PN}-dev  = "${libdir}/*.la ${includedir}"
INSANE_SKIP:${PN} = "dev-so"
