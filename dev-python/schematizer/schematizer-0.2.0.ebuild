# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Turn a generic hierarchical netlist (JSON) into a KiCad schematic"
HOMEPAGE="https://github.com/devbisme/schematizer"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="dev-python/simp-sexp[${PYTHON_USEDEP}]"
