# == Class: docker::epel::cgroups
#
# This puts the proper entry into fstab to enable cgroup
class docker::epel::cgroups {

  file {'/etc/fstab':
    ensure => present,
  } -> 

    file_line {'enable_cgroup_in_fstab':
      line => 'none                    /sys/fs/cgroup          cgroup  defaults        0 0',
      path => '/etc/fstab',
    }
}
