inherit autotools pkgconfig

DESCRIPTION = "libRoboticsCamera"
#LICENSE = "BSD-3-Clause"
#LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/\
#${LICENSE};md5=3775480a712fc46a69647678acb234cb"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/\
${LICENSE};md5=550794465ba0ec5312d6919e203a55f9"

PR = "r0"

def get_depends(d):
  if d.getVar('MACHINE', True) == 'apq8096':
    return "qmmf-sdk"
  else:
    return "media rb-camera av-frameworks"

DEPENDS = "liblog"
DEPENDS += "libcutils"
DEPENDS += "native-frameworks"
DEPENDS += "system-core"
DEPENDS += "glib-2.0"
DEPENDS += "${@get_depends(d)}"


def get_oeconf(d):
  if d.getVar('MACHINE', True) == 'apq8096':
    return "--with-camerahal=${WORKSPACE}/camera/lib/QCamera2/HAL3 --with-qmmf_sdk"
  else:
    return "--with-camhal1"

EXTRA_OECONF:append = " --with-sanitized-headers=${STAGING_KERNEL_BUILDDIR}/usr/include"
EXTRA_OECONF += "${@get_oeconf(d)}"

FILESPATH =+ "${WORKSPACE}:"
SRC_URI   = "file://vendor/qcom/opensource/libroboticscamera/"
 
SRCREV = "${AUTOREV}"
S      = "${WORKDIR}/vendor/qcom/opensource/libroboticscamera/"

PACKAGES = "lib-robotics-camera"
PACKAGES += "lib-robotics-camera-dev"
PACKAGES += "lib-robotics-camera-dbg"

FILES:lib-robotics-camera-dbg    = "${libdir}/.debug/libcamera.*"
FILES:lib-robotics-camera        = "${libdir}/libcamera.so.* ${bindir}/*"
FILES:lib-robotics-camera-dev    = "${libdir}/libcamera.* ${libdir}/libcamera.la ${includedir}"
