# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-MDB2_Driver_sqlite/PEAR-MDB2_Driver_sqlite-1.5.0_beta3.ebuild,v 1.8 2012/09/09 13:56:50 olemarkus Exp $

EAPI="2"

inherit php-pear-r1

DESCRIPTION="Database Abstraction Layer, sqlite driver"
LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ~ppc64 s390 sh sparc x86"
IUSE=""

DEPEND=">=dev-php/PEAR-MDB2-2.5.0_beta3
	|| ( dev-lang/php:5.3[sqlite] dev-lang/php[sqlite2] )"
RDEPEND="${DEPEND}"
