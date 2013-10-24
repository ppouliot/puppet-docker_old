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
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { docker:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class docker {
  case $lsbdistid {
    'Ubuntu': {

      notify {"${lsbdisdescription} Docker Installation":}

      if $lsbdistrelease == '12.04'{
        $required_kernel = ['linux-image-generic-lts-raring',
                            'linux-headers-generic-lts-raring']
      }
  
      if $lsbdistrelease == '13.10' {
        $required_kernel = "linux-image-extra-${kernelrelease}"
      }

      package { "${required_kernel}":
        ensure => latest
      } 

      apt::key {'docker':
        key_source => 'http://get.docker.io/gpg',
      }

      apt::source{'docker':
        location    => 'http://get.docker.io/ubuntu',
        release     => 'docker',
        repos       => 'main',
        include_src => false,
      }
      $docker = 'lxc-docker'
  
      $docker_requirements = [
        Apt::Key['docker'],
        Apt::Source['docker']
      ]
    }
    'CentOS','RedHat','ScientificLinux': {
      package {'epel-release-6.8':
        ensure   => installed,
        provider => rpm,
        source   => "http://dl.fedoraproject.org/pub/epel/6/${architecture}/epel-release-6-8.noarch.rpm",
      }
      yumrepo {'www.hop5.in Centos Repository'
        name => 'hop5',
        baseurl => 'http://www.hop5.in/yum/el6/',
        gpgcheck => 0,
      }
      $required_kernel = "kernel-ml-aufs"
      $docker          = "docker-io"
      $docker_requirements = [
        Package['epel-release-6.8'],
        Yumrepo['www.hop5.in Centos Repository']
      ]
    }
    default: {
      warning('Unsupported Distribution')
    }
  }
}
