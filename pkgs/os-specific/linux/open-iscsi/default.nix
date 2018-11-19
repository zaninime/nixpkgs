{ stdenv, fetchFromGitHub, automake, autoconf, libtool, gettext, utillinux, openisns, openssl, kmod, perl, systemd, pkgconf }:
stdenv.mkDerivation rec {
  name = "open-iscsi-${version}";
  version = "2.0-877-${stdenv.lib.substring 0 7 src.rev}";

  buildInputs = [ automake autoconf libtool gettext utillinux openisns.lib openssl kmod perl systemd pkgconf ];

  src = fetchFromGitHub {
    owner = "open-iscsi";
    repo = "open-iscsi";
    rev = "0ec3a81158ef32da0a2866f8e2cc2ab02f2e3662";
    sha256 = "0icwgcgldildb3blib850f7kll1knyxdylk2ic33rcddr60rxib2";
  };

  DESTDIR = "$(out)";

  NIX_LDFLAGS = "-lkmod";
  NIX_CFLAGS_COMPILE = "-DUSE_KMOD";

  preConfigure = ''
    sed -i 's|/usr|/|' Makefile
  '';

  postInstall = ''
    cp usr/iscsistart $out/sbin/
    $out/sbin/iscsistart -v
  '';

  meta = with stdenv.lib; {
    description = "A high performance, transport independent, multi-platform implementation of RFC3720";
    license = licenses.gpl2Plus;
    homepage = https://www.open-iscsi.com;
    platforms = platforms.linux;
    maintainers = with maintainers; [ cleverca22 ];
  };
}
