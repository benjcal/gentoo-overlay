# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="KiCad schematic manipulation library with exact format preservation"
HOMEPAGE="https://github.com/circuit-synth/kicad-sch-api"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mcp"

RDEPEND="
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/sexpdata[${PYTHON_USEDEP}]
	mcp? (
		dev-python/fastmcp[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
	)
"

PATCHES=( "${FILESDIR}/${P}-optional-mcp.patch" )
