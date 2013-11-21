# == Define docker::run
# Execs a docker run command to retrieve
# a container. 
#
define docker::run(){

  exec {"docker-run-container-${name}":
    command   => "/usr/bin/docker run ${options} ${name}", 
    logoutput => true,
  }
}
