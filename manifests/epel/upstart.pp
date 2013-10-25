# == Class: docker::epel::upstart
# This class accepts additional options for the docker startup
#

class docker::epel::upstart(
  $docker_options = $docker::params::docker_options
)inherits docker::params {

  package {'upstart':
    ensure => latest,
  }
  if $docker_options == !undef  {
    file {'/etc/init/docker.conf':
      ensure  => present,
      content => tempate('docker/upstart.erb'),
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
    }
  } else {

    file {'/etc/init/docker.conf':
      ensure => present,
      source => 'puppet:///modules/docker/etc/init/docker.upstart',
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
    }
  }
}
