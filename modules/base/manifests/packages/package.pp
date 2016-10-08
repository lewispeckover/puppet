define base::packages::package($pkgdata) {
  package { $name: ensure => $pkgdata[$name] }
}
