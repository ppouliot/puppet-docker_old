# == Class: docker::epel::sysctl
# Applys a sysctl.conf with IPv4 enabled
class docker::epel::sysctl(
)inherits docker::params {

  file {'/etc/sysctl.conf':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => "puppet:///modules/docker/etc/sysctl.conf.${osfamily}",
  }
  
}
