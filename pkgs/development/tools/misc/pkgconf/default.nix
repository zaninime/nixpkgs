{ stdenv, fetchurl, meson, ninja }:

stdenv.mkDerivation rec {
  pname = "pkgconf";
  version = "1.6.3";

  src = fetchurl {
    url = "https://git.dereferenced.org/${pname}/${pname}/archive/${pname}-${version}.tar.gz";
    sha256 = "1jvs4zgwj56rsadpamzf41325mp75lb20n9iq02lhq6x4jr1pzav";
  };

  nativeBuildInputs = [ meson ninja ];
  mesonFlags = [ "-Dtests=false" ];

  meta = with stdenv.lib; {
    description = "Package compiler and linker metadata toolkit";
    homepage = https://git.dereferenced.org/pkgconf/pkgconf;
    platforms = platforms.all;
    license = licenses.isc;
    maintainers = with maintainers; [ zaninime ];
  };
}
