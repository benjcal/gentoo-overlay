# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python interface to Ngspice and Xyce circuit simulators"
HOMEPAGE="https://github.com/Innovoltive/InSpice"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/diskcache[${PYTHON_USEDEP}]
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/ply[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
