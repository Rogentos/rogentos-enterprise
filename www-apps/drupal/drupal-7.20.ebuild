# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils webapp depend.php

MY_PV=${PV:0:3}.0

DESCRIPTION="Drupal is a free software package that allows you to easily organize, manage and publish your content, with an endless variety of customization."
HOMEPAGE="http://drupal.org/"
SRC_URI="http://drupal.org/files/projects/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~alpha amd64 ~hppa ~ppc ~ppc64 ~sparc x86"
IUSE="+mysql postgres sqlite"

RDEPEND="dev-lang/php[gd,pdo,xml]
    || ( dev-php/pecl-apc dev-php/xcache )
    dev-php/pecl-uploadprogress
    mysql? ( || ( dev-lang/php[mysql] dev-lang/php[mysqli] ) )
    postgres? ( dev-lang/php[postgres] )
    sqlite? ( dev-lang/php[sqlite3] )"

need_php5_httpd

REQUIRED_USE="|| ( mysql postgres sqlite )"

src_install() {
	webapp_src_preinst

	local docs="MAINTAINERS.txt LICENSE.txt INSTALL.txt CHANGELOG.txt INSTALL.mysql.txt INSTALL.pgsql.txt INSTALL.sqlite.txt UPGRADE.txt "
	dodoc ${docs}
	rm -f ${docs} INSTALL COPYRIGHT.txt

	cp sites/default/{default.settings.php,settings.php}
	insinto "${MY_HTDOCSDIR}"
	doins -r .

	dodir "${MY_HTDOCSDIR}"/files
	webapp_serverowned "${MY_HTDOCSDIR}"/files
	webapp_serverowned "${MY_HTDOCSDIR}"/sites/default
	webapp_serverowned "${MY_HTDOCSDIR}"/sites/default/settings.php

	webapp_configfile "${MY_HTDOCSDIR}"/sites/default/settings.php
	webapp_configfile "${MY_HTDOCSDIR}"/.htaccess

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt

	webapp_src_install
}

pkg_postinst() {
	ewarn
	ewarn "SECURITY NOTICE"
	ewarn "If you plan on using SSL on your Drupal site, please consult the postinstall information:"
	ewarn "\t# webapp-config --show-postinst ${PN} ${PV}"
	ewarn
}
