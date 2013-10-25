# == Define docker::pull
# Execs a docker pull command to retrieve
# a container. 
#
define docker::pull(){

  exec {"docker-pull-container-${name}":
    command   => "/usr/bin/docker pull ${name}", 
    logoutput => true,
  }
}
