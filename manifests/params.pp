# == Class: docker::params
#
#
class docker::params {

  $docker_options = undef

  case $operatingsystem {

    'Ubuntu': {
      if $lsbdistrelease == '12.04'{
        $required_kernel = ['linux-image-generic-lts-raring',
                            'linux-headers-generic-lts-raring']
      }
  
      if $lsbdistrelease == '13.10' {
        $required_kernel = "linux-image-extra-${kernelrelease}"
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

      include docker::ubuntu::firewall
      include docker::ubuntu::cgroups

    }

    'CentOS','RedHat','ScientificLinux': {
      if $operatingsystemmajrelease == '6' {

        package {'epel-release':
          ensure   => installed,
          provider => rpm,
          source   => "http://dl.fedoraproject.org/pub/epel/6/${architecture}/epel-release-6-8.noarch.rpm",
        }

        yumrepo {'www.hop5.in Centos Repository':
          name     => 'hop5',
          baseurl  => 'http://www.hop5.in/yum/el6/',
          gpgcheck => 0,
        }

        $required_kernel = "kernel-ml-aufs"
        $docker          = "docker-io"
        $docker_requirements = [
          File['/etc/selinux/config'],
          Package['epel-release'],
          Yumrepo['www.hop5.in Centos Repository']
        ]

        include docker::epel::selinux
        include docker::epel::cgroups
        include docker::epel::upstart

      } else {
        warning("Unsupported ${operatingsystem} version ${operatingsystemrelease}")
      }
    }

    default: {
      warning('Unsupported Distribution')
    }
  }
}
