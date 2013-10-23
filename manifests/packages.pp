class docker::packages (
  $prereq = $docker::params::prereq
)inherits docker::params {

  package { $prereq:
    ensure => latest,
  }

}

