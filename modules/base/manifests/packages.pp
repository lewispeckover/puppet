class base::packages {
  $pkgdata = hiera_hash('packages', {})
  $packages = keys($pkgdata)
  base::packages::package { $packages: pkgdata => $pkgdata }
}

