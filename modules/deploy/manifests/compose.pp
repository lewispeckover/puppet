class deploy::compose($repos, $environment='master', $source='https://github.com/lewispeckover/compose-') {
  package { "git": ensure => present }

  file { ["/etc/docker/compose", "/etc/docker/compose/.metadata"]: 
    ensure => directory,
    owner => "root",
    group => "root",
    mode => "0750",
    purge => true,
    recurse => true,
    force => true,
    require => Package["docker"],

    compose::repo { $repos: }
}
