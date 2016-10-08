class base::docker {
  class { '::docker':
    storage_driver => 'devicemapper',
    dm_thinpooldev => 'DOCKER-thinpool',
    dm_use_deferred_removal => true,
  }
  class {'::docker::compose': ensure => present, install_path => '/usr/bin' }
  include deploy
}
