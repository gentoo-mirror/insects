# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A cross-platform, open source, and super fast MUD client with scripting in Lua"
HOMEPAGE="https://mudlet.org"
EGIT_REPO_URI="https://github.com/Mudlet/Mudlet.git"
EGIT_COMMIT="342da0b52dc60867e615cc10a58e1c84e037c596"

S="${WORKDIR}/mudlet-4.19.0"

DEPEND="
    dev-libs/libzip
    dev-lang/lua:5.1
    dev-qt/qtbase:6
    dev-libs/pugixml
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="-* ~amd64"

src_configure() {
    CMAKE_INSTALL_LIBDIR = $(get_libdir)
    cmake_src_configure
}
