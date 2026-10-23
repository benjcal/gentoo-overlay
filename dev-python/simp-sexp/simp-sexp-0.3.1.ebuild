# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A simple S-expression parser"
HOMEPAGE="https://github.com/devbisme/simp_sexp"
SRC_URI="$(pypi_sdist_url "${PN}")"
S="${WORKDIR}/simp_sexp-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
