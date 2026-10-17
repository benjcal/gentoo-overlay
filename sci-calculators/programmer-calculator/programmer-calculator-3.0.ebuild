# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Terminal calculator for programmers working with multiple number representations"
HOMEPAGE="https://github.com/alt-romes/programmer-calculator"
SRC_URI="https://github.com/alt-romes/programmer-calculator/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="sys-libs/ncurses:="
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-default-colors.patch" )

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} -std=gnu17" \
		LFLAGS="-lncurses -ltinfo ${LDFLAGS}"
}

src_test() {
	local t
	for t in number-bases random expressions input-formats; do
		./pcalc -n < "tests/${t}.test" | diff -b "tests/${t}.correct" - || die "test ${t} failed"
	done
}

src_install() {
	dobin pcalc
}
