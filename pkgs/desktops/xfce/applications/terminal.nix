{ stdenv, fetchurl, pkgconfig, intltool, ncurses, gnome3, gtk3, vte, dbus-glib
, exo, libxfce4util, libxfce4ui_gtk3
}:

stdenv.mkDerivation rec {
  p_name  = "xfce4-terminal";
  ver_maj = "0.8";
  ver_min = "7.4";

  src = fetchurl {
    url = "mirror://xfce/src/apps/${p_name}/${ver_maj}/${name}.tar.bz2";
    sha256 = "1as2dh5ccmv3hdvsbxm4b0xhmv2ky2q18zxxrzr988x79npri3x8";
  };
  name = "${p_name}-${ver_maj}.${ver_min}";

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ intltool exo gtk3 gnome3.vte_291 libxfce4util ncurses dbus-glib libxfce4ui_gtk3 ];

  meta = {
    homepage = http://www.xfce.org/projects/terminal;
    description = "A modern terminal emulator primarily for the Xfce desktop environment";
    license = stdenv.lib.licenses.gpl2Plus;
    platforms = stdenv.lib.platforms.linux;
  };
}
