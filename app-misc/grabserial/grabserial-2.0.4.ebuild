# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Serial dump and timing program"
HOMEPAGE="https://github.com/straend/grabserial"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="dev-python/pyserial[${PYTHON_USEDEP}]"
