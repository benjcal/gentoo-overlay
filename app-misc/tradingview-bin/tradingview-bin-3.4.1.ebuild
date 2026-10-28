# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Desktop client for the TradingView charting platform"
HOMEPAGE="https://www.tradingview.com/desktop/"
SRC_URI="https://tvd-packages.tradingview.com/ubuntu/stable/latest/jammy/tradingview_amd64.deb -> ${P}.deb"

LICENSE="all-rights-reserved"
SLOT="0"
S="${WORKDIR}"
KEYWORDS="-* ~amd64"
RESTRICT="strip"

QA_PREBUILT="opt/TradingView/*"

RDEPEND="
	app-accessibility/at-spi2-core:2
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libsecret
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa[gbm(+)]
	net-print/cups
	sys-apps/dbus
	sys-apps/systemd-utils[udev]
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
"

src_unpack() {
	unpack "${P}.deb"
	unpack ./data.tar.gz
}

src_install() {
	local dir="/opt/TradingView"

	dodir "${dir}"
	cp -a opt/TradingView/. "${ED}${dir}/" || die

	doicon -s 512 usr/share/icons/hicolor/512x512/apps/tradingview.png
	domenu usr/share/applications/tradingview.desktop
	dodoc usr/share/doc/tradingview/changelog.gz

	dosym -r "${dir}/tradingview" /usr/bin/tradingview
}
