dnl OSSH_CHECK_CFLAG_COMPILE(check_flag[, define_flag])
dnl Check that $CC accepts a flag 'check_flag'. If it is supported append
dnl 'define_flag' to $CFLAGS. If 'define_flag' is not specified, then append
dnl 'check_flag'.
AC_DEFUN([CHECK_COMPILER_CFLAG], [{
	AC_MSG_CHECKING([if $CC supports compile flag $1])
	saved_CFLAGS="$CFLAGS"
	CFLAGS="$CFLAGS $WERROR $1"
	_define_flag="$2"
	test "x$_define_flag" = "x" && _define_flag="$1"
	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv) {
	/* Some math to catch -ftrapv problems in the toolchain */
	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
	float l = i * 2.1;
	double m = l / 0.5;
	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
	exit(0);
}
	]])],
		[
if `grep -i "unrecognized option" conftest.err >/dev/null`
then
		AC_MSG_RESULT([no])
		CFLAGS="$saved_CFLAGS"
else
		AC_MSG_RESULT([yes])
		 CFLAGS="$saved_CFLAGS $_define_flag"
fi],
		[ AC_MSG_RESULT([no])
		  CFLAGS="$saved_CFLAGS" ]
	)
}])

dnl OPENSMTPD_CHECK_CFLAG_LINK(check_flag[, define_flag])
dnl Check that $CC accepts a flag 'check_flag'. If it is supported append
dnl 'define_flag' to $CFLAGS. If 'define_flag' is not specified, then append
dnl 'check_flag'.
AC_DEFUN([CHECK_COMPILER_CFLAG_LINK], [{
	AC_MSG_CHECKING([if $CC supports compile flag $1 and linking succeeds])
	saved_CFLAGS="$CFLAGS"
	CFLAGS="$CFLAGS $WERROR $1"
	_define_flag="$2"
	test "x$_define_flag" = "x" && _define_flag="$1"
	AC_LINK_IFELSE([AC_LANG_SOURCE([[
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv) {
	/* Some math to catch -ftrapv problems in the toolchain */
	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
	float l = i * 2.1;
	double m = l / 0.5;
	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
	exit(0);
}
	]])],
		[
if `grep -i "unrecognized option" conftest.err >/dev/null`
then
		AC_MSG_RESULT([no])
		CFLAGS="$saved_CFLAGS"
else
		AC_MSG_RESULT([yes])
		 CFLAGS="$saved_CFLAGS $_define_flag"
fi],
		[ AC_MSG_RESULT([no])
		  CFLAGS="$saved_CFLAGS" ]
	)
}])

dnl CHECK_COMPILER_LDFLAG_LINK(check_flag[, define_flag])
dnl Check that $LD accepts a flag 'check_flag'. If it is supported append
dnl 'define_flag' to $LDFLAGS. If 'define_flag' is not specified, then append
dnl 'check_flag'.
AC_DEFUN([CHECK_COMPILER_LDFLAG_LINK], [{
	AC_MSG_CHECKING([if $LD supports link flag $1])
	saved_LDFLAGS="$LDFLAGS"
	LDFLAGS="$LDFLAGS $WERROR $1"
	_define_flag="$2"
	test "x$_define_flag" = "x" && _define_flag="$1"
	AC_LINK_IFELSE([AC_LANG_SOURCE([[
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv) {
	/* Some math to catch -ftrapv problems in the toolchain */
	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
	float l = i * 2.1;
	double m = l / 0.5;
	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
	exit(0);
}
		]])],
		[ AC_MSG_RESULT([yes])
		  LDFLAGS="$saved_LDFLAGS $_define_flag"],
		[ AC_MSG_RESULT([no])
		  LDFLAGS="$saved_LDFLAGS" ]
	)
}])

dnl OPENSMTPD_CHECK_HEADER_FOR_FIELD(field, header, symbol)
dnl Does AC_EGREP_HEADER on 'header' for the string 'field'
dnl If found, set 'symbol' to be defined. Cache the result.
dnl TODO: This is not foolproof, better to compile and read from there
AC_DEFUN([OPENSMTPD_CHECK_HEADER_FOR_FIELD], [
# look for field '$1' in header '$2'
	dnl This strips characters illegal to m4 from the header filename
	ossh_safe=`echo "$2" | sed 'y%./+-%__p_%'`
	dnl
	ossh_varname="ossh_cv_$ossh_safe""_has_"$1
	AC_MSG_CHECKING(for $1 field in $2)
	AC_CACHE_VAL($ossh_varname, [
		AC_EGREP_HEADER($1, $2, [ dnl
			eval "$ossh_varname=yes" dnl
		], [ dnl
			eval "$ossh_varname=no" dnl
		]) dnl
	])
	ossh_result=`eval 'echo $'"$ossh_varname"`
	if test -n "`echo $ossh_varname`"; then
		AC_MSG_RESULT($ossh_result)
		if test "x$ossh_result" = "xyes"; then
			AC_DEFINE($3, 1, [Define if you have $1 in $2])
		fi
	else
		AC_MSG_RESULT(no)
	fi
])

AC_DEFUN([CHECK_COMPILER], [{

if test "$GCC" = "yes" || test "$GCC" = "egcs"; then
	CHECK_COMPILER_CFLAG([-Qunused-arguments])
	CHECK_COMPILER_CFLAG([-Wunknown-warning-option])
	CHECK_COMPILER_CFLAG([-Wall])
	CHECK_COMPILER_CFLAG([-Wpointer-arith])
	CHECK_COMPILER_CFLAG([-Wuninitialized])
	CHECK_COMPILER_CFLAG([-Wsign-compare])
	CHECK_COMPILER_CFLAG([-Wformat-security])
	CHECK_COMPILER_CFLAG([-Wsizeof-pointer-memaccess])
	CHECK_COMPILER_CFLAG([-Wpointer-sign], [-Wno-pointer-sign])
	CHECK_COMPILER_CFLAG([-Wunused-result], [-Wno-unused-result])
	CHECK_COMPILER_CFLAG([-fno-strict-aliasing])
	CHECK_COMPILER_CFLAG([-D_FORTIFY_SOURCE=2])
	CHECK_COMPILER_CFLAG([-fPIE])
    if test "x$use_toolchain_hardening" = "x1"; then
	CHECK_COMPILER_LDFLAG_LINK([-Wl,-z,relro])
	CHECK_COMPILER_LDFLAG_LINK([-Wl,-z,now])
	CHECK_COMPILER_LDFLAG_LINK([-Wl,-z,noexecstack])
	CHECK_COMPILER_LDFLAG_LINK([-pie])
	# NB. -ftrapv expects certain support functions to be present in
	# the compiler library (libgcc or similar) to detect integer operations
	# that can overflow. We must check that the result of enabling it
	# actually links. The test program compiled/linked includes a number
	# of integer operations that should exercise this.
	CHECK_COMPILER_CFLAG_LINK([-ftrapv])
    fi
	AC_MSG_CHECKING([gcc version])
	GCC_VER=`$CC -v 2>&1 | $AWK '/gcc version /{print $3}'`
	case $GCC_VER in
		1.*) no_attrib_nonnull=1 ;;
		2.8* | 2.9*)
		     no_attrib_nonnull=1
		     ;;
		2.*) no_attrib_nonnull=1 ;;
		*) ;;
	esac
	AC_MSG_RESULT([$GCC_VER])

	AC_MSG_CHECKING([if $CC accepts -fno-builtin-memset])
	saved_CFLAGS="$CFLAGS"
	CFLAGS="$CFLAGS -fno-builtin-memset"
	AC_LINK_IFELSE([AC_LANG_PROGRAM([[ #include <string.h> ]],
			[[ char b[10]; memset(b, 0, sizeof(b)); ]])],
		[ AC_MSG_RESULT([yes]) ],
		[ AC_MSG_RESULT([no])
		  CFLAGS="$saved_CFLAGS" ]
	)

	# -fstack-protector-all doesn't always work for some GCC versions
	# and/or platforms, so we test if we can.  If it's not supported
	# on a given platform gcc will emit a warning so we use -Werror.
	if test "x$use_stack_protector" = "x1"; then
	    for t in -fstack-protector-strong -fstack-protector-all \
		    -fstack-protector; do
		AC_MSG_CHECKING([if $CC supports $t])
		saved_CFLAGS="$CFLAGS"
		saved_LDFLAGS="$LDFLAGS"
		CFLAGS="$CFLAGS $t -Werror"
		LDFLAGS="$LDFLAGS $t -Werror"
		AC_LINK_IFELSE(
			[AC_LANG_PROGRAM([[ #include <stdio.h> ]],
			[[
	char x[256];
	snprintf(x, sizeof(x), "XXX");
			 ]])],
		    [ AC_MSG_RESULT([yes])
		      CFLAGS="$saved_CFLAGS $t"
		      LDFLAGS="$saved_LDFLAGS $t"
		      AC_MSG_CHECKING([if $t works])
		      AC_RUN_IFELSE(
			[AC_LANG_PROGRAM([[ #include <stdio.h> ]],
			[[
	char x[256];
	snprintf(x, sizeof(x), "XXX");
			]])],
			[ AC_MSG_RESULT([yes])
			  break ],
			[ AC_MSG_RESULT([no]) ],
			[ AC_MSG_WARN([cross compiling: cannot test])
			  break ]
		      )
		    ],
		    [ AC_MSG_RESULT([no]) ]
		)
		CFLAGS="$saved_CFLAGS"
		LDFLAGS="$saved_LDFLAGS"
	    done
	fi
fi

AC_MSG_CHECKING([if compiler allows __attribute__ on return types])
AC_COMPILE_IFELSE(
    [AC_LANG_PROGRAM([[
#include <stdlib.h>
__attribute__((__unused__)) static void foo(void){return;}]],
    [[ exit(0); ]])],
    [ AC_MSG_RESULT([yes]) ],
    [ AC_MSG_RESULT([no])
      AC_DEFINE(NO_ATTRIBUTE_ON_RETURN_TYPE, 1,
	 [compiler does not accept __attribute__ on return types]) ]
)

if test "x$no_attrib_nonnull" != "x1" ; then
	AC_DEFINE([HAVE_ATTRIBUTE__NONNULL__], [1], [Have attribute nonnull])
fi

AC_MSG_CHECKING([compiler and flags for sanity])
AC_RUN_IFELSE([AC_LANG_PROGRAM([[ #include <stdio.h> ]], [[ exit(0); ]])],
	[	AC_MSG_RESULT([yes]) ],
	[
		AC_MSG_RESULT([no])
		AC_MSG_ERROR([*** compiler cannot create working executables, check config.log ***])
	],
	[	AC_MSG_WARN([cross compiling: not checking compiler sanity]) ]
)
}])



