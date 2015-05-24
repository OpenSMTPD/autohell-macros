AC_DEFUN([CHECK_SYSTEM_FUNCTIONS], [{
	AC_CHECK_FUNCS([ \
		arc4random \
		arc4random_buf \
		arc4random_stir \
		arc4random_uniform \
		asprintf \
		basename \
		b64_ntop \
		__b64_ntop \
		b64_pton \
		__b64_pton \
		bcopy \
		chflags \
		closefrom \
		daemon \
		dirfd \
		dirname \
		endgrent \
		explicit_bzero \
		fgetln \
		fmt_scaled \
		fparseln \
		freeaddrinfo \
		getaddrinfo \
		getnameinfo \
		getopt \
		getpeereid \
		getspnam \
		inet_aton \
		inet_ntoa \
		inet_ntop \
		isblank \
		memmove \
		nsleep \
		pidfile \
		pw_dup \
		reallocarray \
		scan_scaled \
		setenv \
		setlinebuf \
		setproctitle \
		setregid \
		setreuid \
		setresgid \
		setresuid \
		setsid \
		sigaction \
		socketpair \
		strdup \
		strerror \
		strmode \
		strnvis \
		strtonum \
		sysconf \
		tcgetpgrp \
		truncate \
		utimes \
		vasprintf \
		vsnprintf \
		waitpid \
		writev
	])
	CHECK_STRING_FUNCTIONS
	CHECK_TIME_FUNCTIONS
}])

AC_DEFUN([CHECK_STRING_FUNCTIONS], [{
	AC_CHECK_FUNCS([strsep])
	AC_CHECK_FUNCS([strlcat])
	AC_CHECK_FUNCS([strlcpy])
}])

AC_DEFUN([CHECK_TIME_FUNCTIONS], [{
	AC_CHECK_FUNCS([gettimeofday])

	AC_CHECK_FUNCS([clock_gettime])
	if test x"$ac_cv_func_clock_gettime" = x"no"; then
		AC_CHECK_LIB([rt], [clock_gettime], [], [], [])
		if test x"$ac_cv_lib_rt_clock_gettime" = x"yes"; then
			AC_DEFINE([HAVE_CLOCK_GETTIME], [1],
				[Define to 1 if you have the `clock_gettime' function.])
		fi
	fi
}])
