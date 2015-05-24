AC_DEFUN([HOST_CHECKS], [{
case "$host" in
*-*-darwin*)
	AC_DEFINE([SPT_TYPE], [SPT_REUSEARGV],
		[Define to a Set Process Title type if your system is supported by bsd-setproctitle.c])
	;;

*-*-dragonfly*)
	;;

*-*-linux* | *-gnu* | *-k*bsd*-gnu* )
	AC_DEFINE([SPT_TYPE], [SPT_REUSEARGV])
	;;

*-*-netbsd*)
	AC_DEFINE([BROKEN_STRNVIS], [1],
	    [NetBSD strnvis argument order is swapped compared to OpenBSD])
	;;

*-*-freebsd*)
	AC_DEFINE([BROKEN_STRNVIS], [1],
	    [FreeBSD strnvis argument order is swapped compared to OpenBSD])
	;;

*-*-openbsd*)
	AC_DEFINE([HAVE_ATTRIBUTE__SENTINEL__], [1], [OpenBSD's gcc has sentinel])
	AC_DEFINE([HAVE_ATTRIBUTE__BOUNDED__], [1], [OpenBSD's gcc has bounded])
	YACC='yacc'
	;;
esac
}])

