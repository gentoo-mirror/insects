# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd udev

DESCRIPTION="Open source interface for iCUE LINK Hub and other Corsair AIOs, Hubs for Linux"
HOMEPAGE="https://github.com/jurkovic-nikola/OpenLinkHub"
SRC_URI="https://github.com/jurkovic-nikola/OpenLinkHub/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://git.insects.institute/insects/portage-tarballs/releases/download/${P}/${P}-deps.tar.xz"

LICENSE="GPL-3"
LICENSE+=" MIT Apache-2.0 BSD-2"
SLOT="0"

DEPEND="acct-group/openlinkhub
		acct-user/openlinkhub"
RDEPEND="${DEPEND}
		 virtual/udev
		 virtual/libudev
		 sys-apps/usbutils"
BDEPEND=""

src_compile() {
	ego build .
}

src_install() {
	dodir /opt/OpenLinkHub
	cp -r "${WORKDIR}"/"${P}"/* ${D}/opt/OpenLinkHub
	insinto /lib/udev/rules.d/
	doins 99-openlinkhub.rules
	newinitd "${FILESDIR}"/OpenLinkHub.initd OpenLinkHub
	# FIXME: not sure if this works? test it with systemd
	systemd_dounit "OpenLinkHub.service"
	fperms -R 755 /opt/OpenLinkHub/
	fowners -R openlinkhub:openlinkhub /opt/OpenLinkHub/
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
