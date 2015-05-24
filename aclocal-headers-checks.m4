AC_DEFUN([CHECK_SYSTEM_HEADERS], [{

	AC_CHECK_HEADERS([sys/types.h])
	AC_CHECK_HEADERS([sys/param.h])
	AC_CHECK_HEADERS([sys/time.h])
	AC_CHECK_HEADERS([sys/ndir.h])
	AC_CHECK_HEADERS([sys/dir.h])

	AC_CHECK_HEADERS([mach/mach_time.h])

	AC_CHECK_HEADERS([dirent.h])
	AC_CHECK_HEADERS([limits.h])
	AC_CHECK_HEADERS([ndir.h])
	AC_CHECK_HEADERS([signal.h])
	AC_CHECK_HEADERS([string.h])

}])

AC_DEFUN([CHECK_SOCKET_HEADERS], [{

	AC_CHECK_HEADERS([sys/socket.h])
	AC_CHECK_HEADERS([arpa/inet.h])
	AC_CHECK_HEADERS([netinet/in.h], [], [], [
	#ifdef	HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef	HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	#ifdef	HAVE_ARPA_INET_H
	#include <arpa/inet.h>
	#endif
	])
	AC_CHECK_HEADERS([netinet6/in6.h], [], [], [
	#ifdef	HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef	HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	#ifdef	HAVE_ARPA_INET_H
	#include <arpa/inet.h>
	#endif
	])

}])

AC_DEFUN([CHECK_RESOLVER_HEADERS], [{

	AC_CHECK_HEADERS([netdb.h], [], [], [
	#ifdef	HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef	HAVE_SYS_SOCKET_H
	#include <sys/socket.h>
	#endif
	])

}])

AC_DEFUN([CHECK_FILESYSTEM_HEADERS], [{

	AC_CHECK_HEADERS([sys/bitypes.h])
	AC_CHECK_HEADERS([sys/statfs.h])
	AC_CHECK_HEADERS([sys/statvfs.h])
	AC_CHECK_HEADERS([sys/mount.h], [], [], [
	#ifdef	HAVE_SYS_TYPES_H
	#include <sys/types.h>
	#endif
	#ifdef	HAVE_SYS_PARAM_H
	#include <sys/param.h>
	#endif
	])

}])
