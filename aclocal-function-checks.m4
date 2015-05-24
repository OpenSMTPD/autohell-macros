AC_DEFUN([CHECK_SYSTEM_FUNCTIONS], [{
	AC_CHECK_FUNCS([ \
		arc4random \
		arc4random_buf \
		arc4random_stir \
		arc4random_uniform \
		asprintf \
		b64_ntop \
		__b64_ntop \
		b64_pton \
		__b64_pton \
		bcopy \
		chflags \
		clock_gettime \
		closefrom \
		dirfd \
		dirname \
		endgrent \
		explicit_bzero \
		fgetln \
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
		setenv \
		setlinebuf \
		setproctitle \
		setregid \
		setreuid \
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
		vasprintf \
		vsnprintf \
		waitpid
	])
	CHECK_STRING_FUNCTIONS
}])

AC_DEFUN([CHECK_STRING_FUNCTIONS], [{
	AC_CHECK_FUNCS([strsep])
	AC_CHECK_FUNCS([strlcat])
	AC_CHECK_FUNCS([strlcpy])
}])
