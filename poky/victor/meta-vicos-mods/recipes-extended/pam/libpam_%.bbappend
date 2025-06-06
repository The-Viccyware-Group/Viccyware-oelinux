#RDEPENDS:${PN}-xtests = "${PN}-${libpam_suffix} \
#    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
#    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
#    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
#    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
#    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
#    bash coreutils"

RDEPENDS:${PN}-xtests:remove = "coreutils"
