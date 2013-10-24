define docker::run ($type,$command) inherits docker::params {
  exec {"docker-run-${name}":
    command => '/usr/bin/docker run -

}
