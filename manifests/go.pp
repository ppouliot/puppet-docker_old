class docker::go (
  $gourl = $docker::params::gourl,
  $gopath = $docker::params::gopath,
  $install_root = $docker::params::install_root,
  $goroot = $docker::params::goroot
) inherits docker::params {

  exec {'retrieve-and-extract-Go':
    command => "/usr/bin/wget -cv -O - ${gourl} | /bin/tar -xvzf -",
    cwd     => $install_root,
    creates => $goroot,
  } 

  file {'/etc/profile.d/goroot.sh':
    ensure => file,
    content => template("docker/goroot.erb"),
    require => Exec['retrieve-and-extract-Go'],
  }


  file {$gopath:
    ensure => directory, 
  }
  file {"${gopath}/bin":
    ensure => directory, 
    require => File[$gopath],
  }
  file {"${gopath}/src":
    ensure => directory, 
    require => File[$gopath],
  }
  file {"${gopath}/src/github.com":
    ensure => directory, 
    require => File["${gopath}/src"],
  }
  file {"${gopath}/src/github.com/dotcloud":
    ensure => directory, 
    require => File["${gopath}/src/github.com"],
  }



  file {'/etc/profile.d/gopath.sh':
    ensure => file,
    content => template("docker/gopath.erb"),
    require => Exec['retrieve-and-extract-Go'],
  }

}
