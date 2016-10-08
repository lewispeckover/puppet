define deploy::compose::repo ($branch=hiera(deploy::compose::environment, 'master')) {
  file { "/etc/docker/compose/$name":
    purge => false,
    recurse => false,
    require => Class['docker'],
  } ->
  exec { "git-clone-compose/$name":
    command => "/bin/git clone -b $branch ${deploy::compose::source}$name /etc/docker/compose/$name",
    environment => "HOME=/root/",
    cwd => "/etc/docker/",
    creates => "/etc/docker/compose/$name/.git",
    require => File["/etc/docker/compose"],
  } ->
  file { "/etc/docker/compose/$name/.git":
    ensure => present,
  } ->
  file { "/etc/docker/compose/.metadata/$name":
    ensure => present,
  }
  $checkstr = '[ "$(/bin/git symbolic-ref HEAD 2>/dev/null)" != "refs/heads/'
  $endcheckstr = '" ]'
  $fullcheckstr = "/bin/bash -c '$checkstr$branch$endcheckstr'"
  $urlcheckstr = '[[ "$(/bin/git config --get remote.origin.url 2>/dev/null)" != "'
  $urlendcheckstr = '" ]]'
  $urlfullcheckstr = "/bin/bash -c '$urlcheckstr${deploy::compose::source}$name$urlendcheckstr'"

  exec { "fix-$name-compose-url-checkout":
    environment => "HOME=/root/",
    command => "/bin/git remote rm origin && /bin/git remote add origin ${deploy::compose::source}$name && /bin/git fetch && /bin/git checkout origin/$branch && /bin/git branch --set-upstream-to=origin/$branch $branch && /bin/git reset --hard origin/$branch && /bin/git clean -f -d",
    cwd => "/etc/docker/compose/$name",
    onlyif => $urlfullcheckstr,
    require => File["/etc/docker/compose/$name/.git"],
  } ->
  exec { "fix-$name-compose-checkout":
    environment => "HOME=/root/",
    command => "/bin/git fetch && /bin/git reset --hard && /bin/git checkout -f $branch && /bin/git branch --set-upstream-to=origin/$branch $branch && /bin/git clean -f -d",
    cwd => "/etc/docker/compose/$name",
    onlyif => $fullcheckstr,
    require => File["/etc/docker/compose/$name/.git"],
  }
}
