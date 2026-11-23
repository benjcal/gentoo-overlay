# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-vm-2

MY_PV=${PV/_p/+}
S="${WORKDIR}/jdk-$(ver_cut 1-4)-full"

DESCRIPTION="Prebuilt Java JDK with JavaFX binaries provided by BellSoft Liberica"
HOMEPAGE="https://bell-sw.com/libericajdk/"
SRC_URI="https://download.bell-sw.com/java/${MY_PV}/bellsoft-jdk${MY_PV}-linux-amd64-full.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2-with-classpath-exception"
SLOT=$(ver_cut 1)
KEYWORDS="~amd64"

RESTRICT="preserve-libs strip"
QA_PREBUILT="*"

RDEPEND="
	>=sys-apps/baselayout-java-0.1.0-r1
	media-libs/alsa-lib
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	media-libs/mesa
	virtual/zlib:=
	x11-libs/gtk+:3[wayland]
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libXxf86vm
"

src_install() {
	local dest="/opt/${P}"
	local ddest="${ED}/${dest#/}"

	rm lib/security/cacerts || die
	dosym -r /etc/ssl/certs/java/cacerts "${dest}"/lib/security/cacerts

	dodir "${dest}"
	cp -pPR . "${ddest}" || die

	dosym "${P}" "/opt/${PN}-${SLOT}"

	java-vm_install-env
	java-vm_set-pax-markings "${ddest}"
	java-vm_revdep-mask
	java-vm_sandbox-predict /dev/random /proc/self/coredump_filter
}
