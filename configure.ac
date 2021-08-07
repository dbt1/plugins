AC_INIT([neutrino-plugins],[0.0.1],[https://www.tuxbox-neutrino.org])
AM_INIT_AUTOMAKE([foreign])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES])
AC_GNU_SOURCE

TUXBOX_APPS
TUXBOX_APPS_DIRECTORY
TUXBOX_APPS_PKGCONFIG
TUXBOX_BOXTYPE

AC_PROG_CC
AC_PROG_CXX
PKG_PROG_PKG_CONFIG
## both disabled => libtool still defaults to static
##                  at least the libtool I tested with ;-)
## --enable-shared => build only shared
## --enable-shared --enable-static => build both
AC_DISABLE_STATIC
AC_SYS_LARGEFILE
LT_INIT

PKG_CHECK_MODULES(CURL,libcurl)
PKG_CHECK_MODULES(FREETYPE,freetype2)
PKG_CHECK_MODULES(PNG,libpng)

AC_ARG_WITH(neutrino-source,
	AS_HELP_STRING([--with-neutrino-source=PATH], [path where Neutrino source is located @<:@default=NONE@:>@]]),
	[NEUTRINO_SOURCE="$withval"],
	[NEUTRINO_SOURCE=""])
AC_SUBST(NEUTRINO_SOURCE)

AC_ARG_WITH(neutrino-build,
	AS_HELP_STRING([--with-neutrino-build=PATH], [path where Neutrino is built @<:@default=NONE@:>@]]),
	[NEUTRINO_BUILD="$withval"],
	[NEUTRINO_BUILD=""])
AC_SUBST(NEUTRINO_BUILD)

AC_ARG_ENABLE(asc2uni,
	AS_HELP_STRING([--enable-asc2uni], [enable asc2uni @<:@default=no@:>@]),
	[enable_asc2uni="$enableval"],
	[enable_asc2uni="no"])
AM_CONDITIONAL(ENABLE_ASC2UNI, test "$enable_asc2uni" = "yes")

AC_ARG_ENABLE(coolitsclimax,
	AS_HELP_STRING([--enable-coolitsclimax], [enable coolitsclimax @<:@default=no@:>@]),
	[enable_coolitsclimax="$enableval"],
	[enable_coolitsclimax="no"])
AM_CONDITIONAL(ENABLE_COOLITSCLIMAX, test "$enable_coolitsclimax" = "yes")

AC_ARG_ENABLE(fritzcallmonitor,
	AS_HELP_STRING([--enable-fritzcallmonitor], [enable fritzcallmonitor @<:@default=no@:>@]),
	[enable_fritzcallmonitor="$enableval"],
	[enable_fritzcallmonitor="no"])
AM_CONDITIONAL(ENABLE_FRITZCALLMONITOR, test "$enable_fritzcallmonitor" = "yes")

AC_ARG_ENABLE(fritzinfomonitor,
	AS_HELP_STRING([--enable-fritzinfomonitor], [enable fritzinfomonitor @<:@default=no@:>@]),
	[enable_fritzinfomonitor="$enableval"],
	[enable_fritzinfomonitor="no"])
AM_CONDITIONAL(ENABLE_FRITZINFOMONITOR, test "$enable_fritzinfomonitor" = "yes")

AC_ARG_ENABLE(getrc,
	AS_HELP_STRING([--enable-getrc], [enable getrc @<:@default=no@:>@]),
	[enable_getrc="$enableval"],
	[enable_getrc="no"])
AM_CONDITIONAL(ENABLE_GETRC, test "$enable_getrc" = "yes")

AC_ARG_ENABLE(input,
	AS_HELP_STRING([--enable-input], [enable input @<:@default=no@:>@]),
	[enable_input="$enableval"],
	[enable_input="no"])
AM_CONDITIONAL(ENABLE_INPUT, test "$enable_input" = "yes")

AC_ARG_ENABLE(logomask,
	AS_HELP_STRING([--enable-logomask], [enable logomask @<:@default=no@:>@]),
	[enable_logomask="$enableval"],
	[enable_logomask="no"])
AM_CONDITIONAL(ENABLE_LOGOMASK, test "$enable_logomask" = "yes")

AC_ARG_ENABLE(logoview,
	AS_HELP_STRING([--enable-logoview], [enable logoview @<:@default=no@:>@]),
	[enable_logoview="$enableval"],
	[enable_logoview="no"])
AM_CONDITIONAL(ENABLE_LOGOVIEW, test "$enable_logoview" = "yes")

AS_IF(test "$enable_logoview" = "yes",
	AS_IF(test -z "$NEUTRINO_SOURCE", AC_MSG_ERROR([logoview needs --with-neutrino-source=...]))
	AS_IF(test -z "$NEUTRINO_BUILD",  AC_MSG_ERROR([logoview needs --with-neutrino-build=...])))

AC_ARG_ENABLE(msgbox,
	AS_HELP_STRING([--enable-msgbox], [enable msgbox @<:@default=no@:>@]),
	[enable_msgbox="$enableval"],
	[enable_msgbox="no"])
AM_CONDITIONAL(ENABLE_MSGBOX, test "$enable_msgbox" = "yes")

AC_ARG_ENABLE(satfind,
	AS_HELP_STRING([--enable-satfind], [enable satfind @<:@default=no@:>@]),
	[enable_satfind="$enableval"],
	[enable_satfind="no"])
AM_CONDITIONAL(ENABLE_SATFIND, test "$enable_satfind" = "yes")

AC_ARG_ENABLE(shellexec,
	AS_HELP_STRING([--enable-shellexec], [enable shellexec @<:@default=no@:>@]),
	[enable_shellexec="$enableval"],
	[enable_shellexec="no"])
AM_CONDITIONAL(ENABLE_SHELLEXEC, test "$enable_shellexec" = "yes")

AC_ARG_ENABLE(showiframe,
	AS_HELP_STRING([--enable-showiframe], [enable showiframe @<:@default=no@:>@]),
	[enable_showiframe="$enableval"],
	[enable_showiframe="no"])
AM_CONDITIONAL(ENABLE_SHOWIFRAME, test "$enable_showiframe" = "yes")

AC_ARG_ENABLE(stbup,
	AS_HELP_STRING([--enable-stbup], [enable stbup @<:@default=no@:>@]),
	[enable_stbup="$enableval"],
	[enable_stbup="no"])
AM_CONDITIONAL(ENABLE_STBUP, test "$enable_stbup" = "yes")

AC_ARG_ENABLE(tuxcal,
	AS_HELP_STRING([--enable-tuxcal], [enable tuxcal @<:@default=no@:>@]),
	[enable_tuxcal="$enableval"],
	[enable_tuxcal="no"])
AM_CONDITIONAL(ENABLE_TUXCAL, test "$enable_tuxcal" = "yes")

AC_ARG_ENABLE(tuxcom,
	AS_HELP_STRING([--enable-tuxcom], [enable tuxcom @<:@default=no@:>@]),
	[enable_tuxcom="$enableval"],
	[enable_tuxcom="no"])
AM_CONDITIONAL(ENABLE_TUXCOM, test "$enable_tuxcom" = "yes")

AC_ARG_ENABLE(tuxmail,
	AS_HELP_STRING([--enable-tuxmail], [enable tuxmail @<:@default=no@:>@]),
	[enable_tuxmail="$enableval"],
	[enable_tuxmail="no"])
AM_CONDITIONAL(ENABLE_TUXMAIL, test "$enable_tuxmail" = "yes")

AC_ARG_ENABLE(tuxwetter,
	AS_HELP_STRING([--enable-tuxwetter], [enable tuxwetter @<:@default=no@:>@]),
	[enable_tuxwetter="$enableval"],
	[enable_tuxwetter="no"])
AM_CONDITIONAL(ENABLE_TUXWETTER, test "$enable_tuxwetter" = "yes")

AC_ARG_ENABLE(2webtvxml,
	AS_HELP_STRING([--enable-2webtvxml], [enable 2webTVxml @<:@default=no@:>@]),
	[enable_2webtvxml="$enableval"],
	[enable_2webtvxml="no"])
AM_CONDITIONAL(ENABLE_2WEBTVXML, test "$enable_2webtvxml" = "yes")

AC_ARG_ENABLE(add-locale,
	AS_HELP_STRING([--enable-add-locale], [enable add-locale @<:@default=no@:>@]),
	[enable_add_locale="$enableval"],
	[enable_add_locale="no"])
AM_CONDITIONAL(ENABLE_ADD_LOCALE, test "$enable_add_locale" = "yes")

AC_ARG_ENABLE(ard_mediathek,
	AS_HELP_STRING([--enable-ard_mediathek], [enable ard_mediathek @<:@default=no@:>@]),
	[enable_ard_mediathek="$enableval"],
	[enable_ard_mediathek="no"])
AM_CONDITIONAL(ENABLE_ARD_MEDIATHEK, test "$enable_ard_mediathek" = "yes")

AC_ARG_ENABLE(epgfilter,
	AS_HELP_STRING([--enable-epgfilter], [enable epgfilter @<:@default=no@:>@]),
	[enable_epgfilter="$enableval"],
	[enable_epgfilter="no"])
AM_CONDITIONAL(ENABLE_EPGFILTER, test "$enable_epgfilter" = "yes")

AC_ARG_ENABLE(epgscan-setup,
	AS_HELP_STRING([--enable-epgscan-setup], [enable epgscan-setup @<:@default=no@:>@]),
	[enable_epgscan_setup="$enableval"],
	[enable_epgscan_setup="no"])
AM_CONDITIONAL(ENABLE_EPGSCAN_SETUP, test "$enable_epgscan_setup" = "yes")

AC_ARG_ENABLE(favorites2bin,
	AS_HELP_STRING([--enable-favorites2bin], [enable favorites2bin @<:@default=no@:>@]),
	[enable_favorites2bin="$enableval"],
	[enable_favorites2bin="no"])
AM_CONDITIONAL(ENABLE_FAVORITES2BIN, test "$enable_favorites2bin" = "yes")

AC_ARG_ENABLE(freeze,
	AS_HELP_STRING([--enable-freeze], [enable freeze @<:@default=no@:>@]),
	[enable_freeze="$enableval"],
	[enable_freeze="no"])
AM_CONDITIONAL(ENABLE_FREEZE, test "$enable_freeze" = "yes")

AC_ARG_ENABLE(fritzinfomonitor-setup,
	AS_HELP_STRING([--enable-fritzinfomonitor-setup], [enable fritzinfomonitor-setup @<:@default=no@:>@]),
	[enable_fritzinfomonitor_setup="$enableval"],
	[enable_fritzinfomonitor_setup="no"])
AM_CONDITIONAL(ENABLE_FRITZINFOMONITOR_SETUP, test "$enable_fritzinfomonitor_setup" = "yes")

AC_ARG_ENABLE(heizoelpreise,
	AS_HELP_STRING([--enable-heizoelpreise], [enable heizoelpreise @<:@default=no@:>@]),
	[enable_heizoelpreise="$enableval"],
	[enable_heizoelpreise="no"])
AM_CONDITIONAL(ENABLE_HEIZOELPREISE, test "$enable_heizoelpreise" = "yes")

AC_ARG_ENABLE(localtv,
	AS_HELP_STRING([--enable-localtv], [enable localtv @<:@default=no@:>@]),
	[enable_localtv="$enableval"],
	[enable_localtv="no"])
AM_CONDITIONAL(ENABLE_LOCALTV, test "$enable_localtv" = "yes")

AC_ARG_ENABLE(logoupdater,
	AS_HELP_STRING([--enable-logoupdater], [enable logoupdater @<:@default=no@:>@]),
	[enable_logoupdater="$enableval"],
	[enable_logoupdater="no"])
AM_CONDITIONAL(ENABLE_LOGOUPDATER, test "$enable_logoupdater" = "yes")

AC_ARG_ENABLE(mtv,
	AS_HELP_STRING([--enable-mtv], [enable mtv @<:@default=no@:>@]),
	[enable_mtv="$enableval"],
	[enable_mtv="no"])
AM_CONDITIONAL(ENABLE_MTV, test "$enable_mtv" = "yes")

AC_ARG_ENABLE(netzkino,
	AS_HELP_STRING([--enable-netzkino], [enable netzkino @<:@default=no@:>@]),
	[enable_netzkino="$enableval"],
	[enable_netzkino="no"])
AM_CONDITIONAL(ENABLE_NETZKINO, test "$enable_netzkino" = "yes")

AC_ARG_ENABLE(openvpn-setup,
	AS_HELP_STRING([--enable-openvpn-setup], [enable openvpn-setup @<:@default=no@:>@]),
	[enable_openvpn_setup="$enableval"],
	[enable_openvpn_setup="no"])
AM_CONDITIONAL(ENABLE_OPENVPN_SETUP, test "$enable_openvpn_setup" = "yes")

AC_ARG_ENABLE(rcu_switcher,
	AS_HELP_STRING([--enable-rcu_switcher], [enable rcu_switcher @<:@default=no@:>@]),
	[enable_rcu_switcher="$enableval"],
	[enable_rcu_switcher="no"])
AM_CONDITIONAL(ENABLE_RCU_SWITCHER, test "$enable_rcu_switcher" = "yes")

AC_ARG_ENABLE(rss,
	AS_HELP_STRING([--enable-rss], [enable rss-reader @<:@default=no@:>@]),
	[enable_rss="$enableval"],
	[enable_rss="no"])
AM_CONDITIONAL(ENABLE_RSS, test "$enable_rss" = "yes")

AC_ARG_ENABLE(spiegel_tv_doc,
	AS_HELP_STRING([--enable-spiegel_tv_doc], [enable spiegel-tv-doc @<:@default=no@:>@]),
	[enable_spiegel_tv_doc="$enableval"],
	[enable_spiegel_tv_doc="no"])
AM_CONDITIONAL(ENABLE_SPIEGEL_TV_DOC, test "$enable_spiegel_tv_doc" = "yes")

AC_ARG_ENABLE(stb_startup,
	AS_HELP_STRING([--enable-stb_startup], [enable stb_startup @<:@default=no@:>@]),
	[enable_stb_startup="$enableval"],
	[enable_stb_startup="no"])
AM_CONDITIONAL(ENABLE_STB_STARTUP, test "$enable_stb_startup" = "yes")

AC_ARG_ENABLE(tierwelt_tv,
	AS_HELP_STRING([--enable-tierwelt_tv], [enable tierwelt-tv @<:@default=no@:>@]),
	[enable_tierwelt_tv="$enableval"],
	[enable_tierwelt_tv="no"])
AM_CONDITIONAL(ENABLE_TIERWELT_TV, test "$enable_tierwelt_tv" = "yes")

AC_ARG_ENABLE(userbouquets,
	AS_HELP_STRING([--enable-userbouquets], [enable userbouquets @<:@default=no@:>@]),
	[enable_userbouquets="$enableval"],
	[enable_userbouquets="no"])
AM_CONDITIONAL(ENABLE_USERBOUQUETS, test "$enable_userbouquets" = "yes")

AC_ARG_ENABLE(webchannels,
	AS_HELP_STRING([--enable-webchannels], [enable webchannels @<:@default=no@:>@]),
	[enable_webchannels="$enableval"],
	[enable_webchannels="no"])
AM_CONDITIONAL(ENABLE_WEBCHANNELS, test "$enable_webchannels" = "yes")

AC_ARG_ENABLE(autoreboot,
	AS_HELP_STRING([--enable-autoreboot], [enable autoreboot @<:@default=no@:>@]),
	[enable_autoreboot"$enableval"],
	[enable_autoreboot="no"])
AM_CONDITIONAL(ENABLE_AUTOREBOOT, test "$enable_autoreboot" = "yes")

AC_ARG_ENABLE(corona-info,
	AS_HELP_STRING([--enable-corona-info], [enable corona-info @<:@default=no@:>@]),
	[enable_corona_info="$enableval"],
	[enable_corona_info="no"])
AM_CONDITIONAL(ENABLE_CORONA_INFO, test "$enable_corona_info" = "yes")

AC_ARG_ENABLE(dropbox_uploader,
	AS_HELP_STRING([--enable-dropbox_uploader], [enable dropbox_uploader @<:@default=no@:>@]),
	[enable_dropbox_uploader="$enableval"],
	[enable_dropbox_uploader="no"])
AM_CONDITIONAL(ENABLE_DROPBOX_UPLOADER, test "$enable_dropbox_uploader" = "yes")

AC_ARG_ENABLE(epgscan,
	AS_HELP_STRING([--enable-epgscan], [enable epgscan @<:@default=no@:>@]),
	[enable_epgscan="$enableval"],
	[enable_epgscan="no"])
AM_CONDITIONAL(ENABLE_EPGSCAN, test "$enable_epgscan" = "yes")

AC_ARG_ENABLE(imgbackup,
	AS_HELP_STRING([--enable-imgbackup], [enable imgbackup @<:@default=no@:>@]),
	[enable_imgbackup="$enableval"],
	[enable_imgbackup="no"])
AM_CONDITIONAL(ENABLE_IMGBACKUP, test "$enable_imgbackup" = "yes")

AC_ARG_ENABLE(mountpointmanagement,
	AS_HELP_STRING([--enable-mountpointmanagement], [enable mountpointmanagement @<:@default=no@:>@]),
	[enable_mountpointmanagement="$enableval"],
	[enable_mountpointmanagement="no"])
AM_CONDITIONAL(ENABLE_MOUNTPOINTMANAGEMENT, test "$enable_mountpointmanagement" = "yes")

AC_ARG_ENABLE(pr-auto-timer,
	AS_HELP_STRING([--enable-pr-auto-timer], [enable pr-auto-timer @<:@default=no@:>@]),
	[enable_pr_auto_timer="$enableval"],
	[enable_pr_auto_timer="no"])
AM_CONDITIONAL(ENABLE_PR_AUTO_TIMER, test "$enable_pr_auto_timer" = "yes")

AC_ARG_ENABLE(smarthomeinfo,
	AS_HELP_STRING([--enable-smarthomeinfo], [enable smarthomeinfo @<:@default=no@:>@]),
	[enable_smarthomeinfo="$enableval"],
	[enable_smarthomeinfo="no"])
AM_CONDITIONAL(ENABLE_SMARTHOMEINFO, test "$enable_smarthomeinfo" = "yes")

AC_ARG_ENABLE(wortraten,
	AS_HELP_STRING([--enable-wortraten], [enable wortraten @<:@default=no@:>@]),
	[enable_wortraten="no"],
	[enable_wortraten="$enableval"])
AM_CONDITIONAL(ENABLE_WORTRATEN, test "$enable_wortraten" = "yes")

AC_CONFIG_FILES([
Makefile
asc2uni/Makefile
cooliTSclimax/Makefile
data/Makefile
data/fonts/Makefile
FritzCallMonitor/Makefile
FritzInfoMonitor/Makefile
getrc/Makefile
input/Makefile
logomask/Makefile
logoview/Makefile
msgbox/Makefile
satfind/Makefile
scripts-lua/Makefile
scripts-lua/plugins/Makefile
scripts-lua/plugins/2webTVxml/Makefile
scripts-lua/plugins/add-locale/Makefile
scripts-lua/plugins/ard_mediathek/Makefile
scripts-lua/plugins/epgfilter/Makefile
scripts-lua/plugins/EPGscan-setup/Makefile
scripts-lua/plugins/favorites2bin/Makefile
scripts-lua/plugins/freeze/Makefile
scripts-lua/plugins/FritzInfoMonitor-setup/Makefile
scripts-lua/plugins/heizoelpreise/Makefile
scripts-lua/plugins/LocalTV/Makefile
scripts-lua/plugins/logoupdater/Makefile
scripts-lua/plugins/mtv/Makefile
scripts-lua/plugins/netzkino/Makefile
scripts-lua/plugins/openvpn-setup/Makefile
scripts-lua/plugins/openvpn-setup/openvpn-setup/Makefile
scripts-lua/plugins/rcu_switcher/Makefile
scripts-lua/plugins/rss/Makefile
scripts-lua/plugins/spiegel-tv-doc/Makefile
scripts-lua/plugins/stb_startup/Makefile
scripts-lua/plugins/stb_startup-ddt/Makefile
scripts-lua/plugins/tierwelt-tv/Makefile
scripts-lua/plugins/userbouquets/Makefile
scripts-lua/plugins/webradio/Makefile
scripts-lua/plugins/webtv/Makefile
scripts-sh/Makefile
scripts-sh/plugins/Makefile
scripts-sh/plugins/autoreboot/Makefile
scripts-sh/plugins/corona-info/Makefile
scripts-sh/plugins/dropbox_uploader/Makefile
scripts-sh/plugins/EPGscan/Makefile
scripts-sh/plugins/imgbackup/Makefile
scripts-sh/plugins/mountpointmanagement/Makefile
scripts-sh/plugins/pr-auto-timer/Makefile
scripts-sh/plugins/smarthomeinfo/Makefile
scripts-sh/plugins/wortraten/Makefile
shellexec/Makefile
shellexec/shellexec.conf
showiframe/Makefile
stbup/Makefile
tuxcal/Makefile
tuxcal/daemon/Makefile
tuxcom/Makefile
tuxmail/Makefile
tuxmail/daemon/Makefile
tuxwetter/Makefile
vu-initfb/Makefile
vu-oled_ctrl/Makefile
vu-turnoff_power/Makefile
])

AC_OUTPUT
