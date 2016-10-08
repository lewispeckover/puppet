class base::packages {
  $pkgdata = hiera_hash('packages', {})
  $pkgs = keys($pkgdata)
  pkg { $pkgs: pkgdata => $pkgdata }

  define pkg($pkgdata) {
    package { $name: ensure => $pkgdata[$name] }
  }
}

