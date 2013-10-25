# == Class: docker::epel::selinux
#
# This replaces the selinux config
class docker::epel::selinux {
  file {'/etc/selinux/config':
    ensure => present,
    source => 'puppet:///modules/docker/etc/selinux/config',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
}
