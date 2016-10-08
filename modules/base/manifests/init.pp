class base {
  include base::users
  include base::sudoers
  include base::sshd
  include base::docker
  include base::packages
  include base::firewall
}
