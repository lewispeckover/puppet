class base::sudoers {
  package { "sudo":
    ensure => installed
  } ->
  augeas { 'sudo-ssh-sock':
    context => '/files/etc/sudoers',
    onlyif  => "match Defaults/env_keep/var[. = 'SSH_AUTH_SOCK'] size==0",
    changes => [
      'ins Defaults after Defaults[last()]',
      'clear Defaults[last()]/env_keep/append',
      'set Defaults[last()]/env_keep/var[1] SSH_AUTH_SOCK'
    ]
  }
  augeas { 'sudowheel':
    context => '/files/etc/sudoers',
    changes => [
      # allow wheel users to use sudo
      'set spec[user = "%wheel"]/user %wheel',
      'set spec[user = "%wheel"]/host_group/host ALL',
      'set spec[user = "%wheel"]/host_group/command ALL',
      'set spec[user = "%wheel"]/host_group/command/runas_user ALL',
      'set spec[user = "%wheel"]/host_group/command/tag NOPASSWD',
    ]
  }
}
