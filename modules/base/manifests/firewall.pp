class base::firewall {
  if ($osfamily == 'RedHat') {
    if (versioncmp($operatingsystemmajrelease, '7') >= 0) {
      class { 'firewalld': }
    }
    else {
      notify { "Firewall is only implemented for firewalld stuff, you should probably fix that": }
    }
  }
}
