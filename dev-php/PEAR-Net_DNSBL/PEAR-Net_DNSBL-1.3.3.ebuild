# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-Net_DNSBL/PEAR-Net_DNSBL-1.3.3.ebuild,v 1.1 2009/08/22 19:41:38 beandog Exp $

inherit php-pear-r1

DESCRIPTION="DNSBL Checker"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""
RDEPEND=">=dev-php/PEAR-Cache_Lite-1.5.2-r1
	>=dev-php/PEAR-Net_CheckIP-1.1-r1
	>=dev-php/PEAR-HTTP_Request-1.2.4-r1
	>=dev-php/PEAR-Net_DNS-1.0.0"
