# Habitat Scaffolding used to generate Scaffolding

scaffolding_scaffolding_install() {
  install -D -m 0644 "$PLAN_CONTEXT/lib/scaffolding.sh" "$pkg_prefix/lib/scaffolding.sh"
}

do_default_download() {
  return 0
}

do_default_verify() {
  return 0
}

do_default_unpack() {
  return 0
}

do_default_build() {
  return 0
}

do_default_install() {
  scaffolding_scaffolding_install
}
