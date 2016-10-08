class base::firewall::iptables::pre {
  Firewall {
    require => undef,
  }
  # Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }->
  firewall { '001 accept all igmp':
    proto   => 'igmp',
    action  => 'accept',
  }->
  firewall { '002 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '003 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }->
  firewall { '004 any udp ntp':
    proto   => 'udp',
    dport => 123,
    action  => 'accept',
  }->
  firewall { '005 any tcp ntp':
    proto   => 'udp',
    dport => 123,
    state => 'NEW',
    action  => 'accept',
  }->
  firewall { '006 any igmp multicast':
    proto   => 'igmp',
    action  => 'accept',
  }->
  firewall { '008 ssh':
    proto   => 'tcp',
    dport => 22,
    state   => 'NEW',
    action  => 'accept',
  }
}
