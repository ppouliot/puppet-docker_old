class docker::src (
  $goroot      = $docker::params::goroot,
  $gopath      = $docker::params::gopath,
  $docker_root = $docker::params::docker_root,
  $docker_home = $docker::params::docker_home,
  $docker_src  = $docker::params::docker_src,
)inherits docker::params {

  Exec { path => [ "${::path}",
                   "${gopath}/bin/",
                   "${goroot}/bin/"],
  }


  vcsrepo { $docker_home:
    ensure   => present, 
    provider => git,
    source   => $docker_src,        
    require  => File[ $docker_root ],
  }


  exec {'go-get-docker':
    command   => 'go get -v github.com/dotcloud/docker/',
    logoutput => true,
    timeout   => 0,
    cwd       => $docker_root,
    require   => Vcsrepo[$docker_home],
  }
  file {'/usr/local/bin/docker':
    ensure  => link,
    target  => "${gopath}/bin/docker",
    require => Exec['go-get-docker'],
  }
}
