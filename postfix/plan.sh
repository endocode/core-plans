pkg_name=postfix
pkg_origin=therealpadams
pkg_version="3.2.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('IPL-1.0')
pkg_source="https://de.postfix.org/ftpmirror/official/${pkg_name}-${pkg_version}.tar.gz"
pkg_deps=()
pkg_build_deps=(core/linux-headers core/coreutils core/gnupg core/wget core/make core/gcc core/db core/glibc core/pcre)
pkg_description="Postfix is a mail server which attempts to be fast, easy to administer, and secure."
pkg_upstream_url="http://www.postfix.org"

do_verify() {
#    cd ${HAB_CACHE_SRC_PATH}/${pkg_dirname}
#    wget -O gpg.1 https://de.postfix.org/ftpmirror/official/${pkg_name}-${pkg_version}.tar.gz.gpg1
#    wget -O gpg.2 https://de.postfix.org/ftpmirror/official/${pkg_name}-${pkg_version}.tar.gz.gpg2
#    wget -O wietse.pgp https://de.postfix.org/ftpmirror/wietse.pgp
#    gpg --import wietse.pgp
#    gpg --verify gpg.1 ../${pkg_filename}
#    gpg --verify gpg.2 ../${pkg_filename}
    return 0
}

do_build() {
    make makefiles CCARGS="-DHAS_DB -I$(hab pkg path core/db)/include" \
	           AUXLIBS="-L$(hab pkg path core/glibc)/lib -lnsl -lresolv \
		            -L$(hab pkg path core/db)/lib -ldb"
    make -j $(nproc)
}

do_install() {
    make non-interactive-package install_root=$PREFIX PATH=$PATH AUXLIBS="-L$(hab pkg path core/glibc)/lib -lnsl -lresolv -L$(hab pkg path core/db)/lib -ldb" 
}
