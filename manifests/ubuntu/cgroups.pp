# == Class: docker::ubuntu::cgroups
#
# Configures Ubuntu Firewall to allow for Docker connectivity 

class docker::ubuntu::cgroups {

  file {'/etc/default/grub':
    ensure => present,
  } ->
    file_line {'enable_cgroup_in_kernel':
      line => 'GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"',
      path => '/etc/default/grub',
    }
}
