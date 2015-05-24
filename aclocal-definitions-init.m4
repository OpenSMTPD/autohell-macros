AC_DEFUN([DEFINITIONS_INIT], [{
	AC_DEFINE([BROKEN_SETRESUID], [],
		[Define if setresuid() implementation is broken])
	AC_DEFINE([BROKEN_SETRESGID], [],
		[Define if setresgid() implementation is broken])
	AC_DEFINE([BROKEN_SETEUID], [],
		[Define if seteuid() implementation is broken])
}])

