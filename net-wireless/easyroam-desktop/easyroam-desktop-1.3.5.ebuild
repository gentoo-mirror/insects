# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Using this software you can easily connect your device to eduroam® by simply logging in with your DFN-AAI account."
HOMEPAGE="https://easyroam.de/"
SRC_URI="http://packages.easyroam.de/repos/easyroam-desktop/pool/main/e/easyroam-desktop/easyroam_connect_desktop-${PV}+${PV}-linux.deb"

S="${WORKDIR}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* amd64"

RDEPEND="
	dev-libs/glib
	x11-libs/gtk+
	x11-libs/pango
	x11-libs/cairo
	media-libs/harfbuzz
	app-crypt/libsecret
	net-misc/networkmanager
	net-libs/webkit-gtk:4.1[keyring]
	net-libs/libsoup:3.0
	net-libs/glib-networking
"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "s/Exec=easyroam_connect_desktop/Exec=\/usr\/share\/easyroam_connect_desktop\/easyroam_connect_desktop/" "${S}/usr/share/applications/easyroam_connect_desktop.desktop"
	default
}

src_install() {
	mv "${S}/usr" "${D}/"
}
