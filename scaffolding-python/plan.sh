pkg_name=scaffolding-python
pkg_description="Scaffolding for Python Applications"
pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_version="0.1.0"
pkg_license=('Apache-2.0')
pkg_source=nosuchfile.tar.gz
pkg_upstream_url="https://github.com/habitat-sh/core-plans"
pkg_deps=(
  ${pkg_deps[@]}
  core/python
  core/make
)
pkg_scaffolding=core/scaffolding-scaffolding
