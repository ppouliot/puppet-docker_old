# == Class: docker::ubuntu::firewall
#
# Configures Ubuntu Firewall to allow for Docker connectivity 
class docker::ubuntu::firewall {

  file {'/etc/default/ufw':
    ensure => present,
    source => 'puppet:///modules/docker/etc/default/ufw',
    notify => Service['ufw'],
  }
  file {'/etc/ufw/applications.d/docker':
    ensure => present,
    source => 'puppet:///modules/docker/etc/ufw/applications.d/docker',
    notify => Service['ufw'],
  }
  service {'ufw':
    enable => true,
    ensure => running,
  }

}
