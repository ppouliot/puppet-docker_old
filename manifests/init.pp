# == Class: docker
#
# Full description of class docker here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*docker_options*]
# You may use this to specify different docker parameters for upstart.
#
#  docker_options => '-d -H="192.168.1.9:4243" -api-enable-cors'
# === Examples
#
#  class { docker: }
#    $docker_options => '-d -H="192.168.1.9:4243" -api-enable-cors'
#  }
#  docker::pull{'centos':}
#  docker::pull{'ubuntu':}
#
# === Authors
# Peter J. Pouliot <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2013 Peter J. Pouliot, unless otherwise noted.
#

class docker (
  $required_kernel = $docker::params::required_kernel,
  $docker          = $docker::params::docker
)inherits docker::params {

  package { $required_kernel:
    ensure => installed,
  } 

  package { $docker:
    ensure => installed,
    require => [ Package[$required_kernel], $docker_requirements ],
  }
}
