class base::sshd {
  augeas { "sshd_config":
    context => "/files/etc/ssh/sshd_config",
    changes => [
      "set PermitRootLogin no",
      "set PasswordAuthentication no",
    ],
    require => [Class[base::users], Class[base::sudoers]],
  } ~>
  service { "sshd": 
    require => Augeas["sshd_config"],
    ensure => running,
    enable => true,
  }
}
