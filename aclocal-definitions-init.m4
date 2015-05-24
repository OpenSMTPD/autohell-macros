AC_DEFUN([DEFINITIONS_INIT], [{
	AC_DEFINE([BROKEN_SETREUID], [0],
		[Define if setreuid() implementation is broken])
	AC_DEFINE([BROKEN_SETREGID], [0],
		[Define if setregid() implementation is broken])
	AC_DEFINE([BROKEN_SETRESUID], [0],
		[Define if setresuid() implementation is broken])
	AC_DEFINE([BROKEN_SETRESGID], [0],
		[Define if setresgid() implementation is broken])
	AC_DEFINE([BROKEN_SETEUID], [0],
		[Define if seteuid() implementation is broken])

	AC_DEFINE([SPT_TYPE], [0],
		[Define to set process title method if setproctitle() is not available])
}])
