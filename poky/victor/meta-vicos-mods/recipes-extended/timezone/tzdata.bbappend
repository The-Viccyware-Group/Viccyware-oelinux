do_install:append() {
	rm ${D}/etc/localtime
	rm ${D}/etc/timezone
	touch ${D}/etc/localtime
	touch ${D}/etc/timezone
}
