FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://ion.rules \
	    file://qseecom.rules \
	    file://gpio.rules \
	    file://smd23.rules"

do_install:append() {
	# we don't need any v4l stuff (it causes udev to never settle)
	rm -rf ${D}/usr/lib/udev/rules.d/60-persistent-v4l.rules

	# mount-data wants to know when these devices are available
	install -d ${D}/etc/udev/rules.d
	install -m 0644 ${UNPACKDIR}/ion.rules ${D}/etc/udev/rules.d/ion.rules
	install -m 0644 ${UNPACKDIR}/qseecom.rules ${D}/etc/udev/rules.d/qseecom.rules
	install -m 0644 ${UNPACKDIR}/gpio.rules ${D}/etc/udev/rules.d/gpio.rules
	install -m 0644 ${UNPACKDIR}/smd23.rules ${D}/etc/udev/rules.d/smd23.rules
}

FILES:${PN} += "/etc/udev/rules.d"
