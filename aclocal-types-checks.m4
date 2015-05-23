AC_DEFUN([CHECK_SYSTEM_TYPES], [{

	AC_CHECK_TYPES([
		short int,
		long long,
		unsigned long long,
		long double,
		u_char,
		u_short,
		u_int,
		u_long,
		int8_t,
		uint8_t,
		u_int8_t,
		int16_t,
		uint16_t,
		u_int16_t,
		int32_t,
		uint32_t,
		u_int32_t,
		int64_t,
		uint64_t,
		u_int64_t,
		intmax_t,
		uintmax_t])

	AC_CHECK_TYPES([
		clock_t,
		mode_t,
		pid_t,
		size_t,
		ssize_t])

	AC_CHECK_TYPES([struct timeval, struct timespec], [], [], [
	#ifdef HAVE_SYS_TIME_H
	#include <sys/time.h>
	#endif
	])


	AC_CHECK_TYPES(sig_atomic_t, [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_SIGNAL_H
	#include <signal.h>
	#endif
	])

	AC_CHECK_SIZEOF(short int)
	AC_CHECK_SIZEOF(int)
	AC_CHECK_SIZEOF(long int)
	AC_CHECK_SIZEOF(long long int)


	# unless we have a 64-bits integer type, we'll fail build of other components
	if test "$ac_cv_sizeof_long_long_int" = "4"; then
		ac_cv_sizeof_long_long_int=0
	fi

	if test x"$ac_cv_have_int64_t" = x"no" && \
	   test x"$ac_cv_sizeof_long_int" != x"8" && \
	   test x$"ac_cv_sizeof_long_long_int" = x"0"; then
	   echo "Environments without 64-bits integer support are not supported."
	   echo "Contact your vendor or install an alternative compiler (ie: GCC)."
	   exit 1;
	fi
	#	set
}])

AC_DEFUN([CHECK_SOCKET_TYPES], [{

	AC_CHECK_TYPES(socklen_t, [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	])

	AC_CHECK_TYPES([in_addr_t, in_port_t], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_NETINET_INET_H
	#include <netinet/inet.h>
	#endif
	])

	AC_CHECK_TYPES([struct sockaddr_storage], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	])

	AC_CHECK_TYPES([struct sockaddr_in], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_NETINET_IN_H
	#include <netinet/in.h>
	#endif
	])

	AC_CHECK_TYPES([struct sockaddr_in6, struct in6_addr], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_NETINET6_IN6_H
	#include <netinet6/in6.h>
	#endif
	#ifdef HAVE_NETINET_IN_H
	#include <netinet/in.h>
	#endif
	])

}])

AC_DEFUN([CHECK_RESOLVER_TYPES], [{
	AC_CHECK_TYPES([struct addrinfo], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	#ifdef HAVE_NETDB_H
	#include <netdb.h>
	#endif
	])
}])

AC_DEFUN([CHECK_FILESYSTEM_TYPES], [{
	AC_CHECK_TYPES([fsblkcnt_t, fsfilcnt_t], [], [], [
	#ifdef HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef HAVE_SYS_BITYPES_H
	#include <sys/bitypes.h>
	#endif
	#ifdef HAVE_SYS_STATFS_H
	#include <sys/statfs.h>
	#endif
	#ifdef HAVE_SYS_STATVFS_H
	#include <sys/statvfs.h>
	#endif
	])
}])
