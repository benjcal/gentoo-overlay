# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Pythonic circuit design for production-ready KiCad projects"
HOMEPAGE="https://github.com/circuit-synth/circuit-synth"
SRC_URI="$(pypi_sdist_url "${PN}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+spice ai mcp"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/cachetools[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	dev-python/kicad-sch-api[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/sexpdata[${PYTHON_USEDEP}]
	dev-python/twine[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	ai? ( dev-python/openai[${PYTHON_USEDEP}] )
	mcp? ( dev-python/kicad-sch-api[mcp,${PYTHON_USEDEP}] )
	spice? (
		dev-python/pyspice[${PYTHON_USEDEP}]
		sci-electronics/ngspice[shared]
	)
"

PATCHES=( "${FILESDIR}/${P}-optional-ai-spice.patch" )
