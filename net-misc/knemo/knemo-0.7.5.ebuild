# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/knemo/knemo-0.7.5.ebuild,v 1.2 2012/11/13 08:07:11 polynomial-c Exp $

EAPI=4

KDE_LINGUAS="ar bg br bs cs cy da de el en_GB eo es et fi fr ga gl hr hu is it
ja ka km lt ms nb nds nl pl pt pt_BR ro ru rw sk sr sv tr ug uk zh_CN zh_TW"

inherit kde4-base

DESCRIPTION="The KDE Network Monitor"
HOMEPAGE="http://kde-apps.org/content/show.php?content=12956"
SRC_URI="http://www.kde-apps.org/CONTENT/content-files/12956-${P}.tar.bz2"

SLOT="4"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
IUSE="debug wifi"

DEPEND="
	$(add_kdebase_dep systemsettings)
	dev-libs/libnl:3
	sys-apps/net-tools
	x11-libs/qt-sql:4[sqlite]
	wifi? ( net-wireless/wireless-tools )
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_no wifi WIRELESS_SUPPORT)
	)

	kde4-base_src_configure
}
