class docker::params {

  $prereq = ["linux-image-extra-${kernelrelease}",
             'lxc',
             'curl',
             'xz-utils',
             'git',
             'mercurial']

  $install_root = '/opt'
  $gourl  = 'http://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz'
  $goroot = "${install_root}/go" 
  $gopath = "${install_root}/gocode" 

  $docker_root = "${gopath}/src/github.com/dotcloud"
  $docker_home = "${docker_root}/docker"
  $docker_src  = "https://github.com/dotcloud/docker.git"
}
