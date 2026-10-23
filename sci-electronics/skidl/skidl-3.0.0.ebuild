# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python package for textually describing electronic circuit schematics"
HOMEPAGE="https://github.com/devbisme/skidl"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="
	dev-python/deprecation[${PYTHON_USEDEP}]
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/inspice[${PYTHON_USEDEP}]
	dev-python/kinet2pcb[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/schematizer[${PYTHON_USEDEP}]
	dev-python/simp-sexp[${PYTHON_USEDEP}]
"
