class deploy {
  create_resources('docker_network', hiera_hash('docker::networks', {}))
  class { 'deploy::compose': repos => hiera_array('deploy::compose::repos', []) }
  create_resources('deploy::app', hiera_hash('deploy::apps', {}))
}
