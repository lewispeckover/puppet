class base::firewall {
  if ($osfamily == 'RedHat') {
    if (versioncmp($operatingsystemmajrelease, '7') >= 0) {
      class { 'firewalld': }
    }
    else {
      # legacy iptables
      include ::firewall
      class { ['base::firewall::iptables::pre', 'base::firewall::iptables::post']: }
      Firewall {
        before  => [Class['base::firewall::iptables::post'], Resources['firewall']],
        require => Class['base::firewall::iptables::pre'],
      }
      resources { '::firewall': purge => hiera('firewall::purge', true) }
      create_resources('::firewall', hiera_hash('firewall', {}))
    }
  }
}
