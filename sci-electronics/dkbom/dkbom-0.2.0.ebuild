# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Digi-Key catalogue browser that assigns parts to a KiCad BOM"
HOMEPAGE="https://github.com/benjcal/dkbom"
SRC_URI="https://github.com/benjcal/dkbom/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-qt/qtbase:6[gui,network]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=( -DBUILD_TESTING=$(usex test) )
	cmake_src_configure
}
