class deploy::app::loadbalancer($opts) {
  deploy::compose::repo { 'loadbalancer': }
#  firewall { '80,443 tcp':
#    proto  => 'tcp',
#    dport  => [80,443],
#    action => 'accept'
#  }
}
