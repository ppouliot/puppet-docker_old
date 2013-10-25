puppet-docker
==============
A puppet module to install and control Docker

Docker is an open source project to pack, ship and
run any application as a lightweight container.
Additional information on Docker can be located here:

 * http://docker.io

The basic scenario allows the user to install Docker.
Additional subclasses allow for control.
This module was inspired by the documentation found here:

 * http://docs.docker.io/en/latest/installation/ubuntulinux/

Distributions
----------------
Currently this should work on the following distributions.

  * Ubuntu 12.04 LTS
  * Ubuntu 13.10
  * CentOS 6.4
  * ScientificLinux 6.4
 
Installation
------------

    class { 'docker': }

Adding Containers
-----------------
To have docker automaticall pull containers from index.docker.io add the following to your node definition:

    node foo.contoso.ltd {
      class {'docker:'}
      docker::pull{'ubuntu':}
      docker::pull{'centos':}
    }

Custom Startup Parameters
-------------------------
You may also provide your own startup options by issuing the following

    node foo.contoso.ltd {
      class { docker: }
        $docker_options => '-d -H="192.168.1.9:4243" -api-enable-cors'
      }
    }


Contributors
------------
 * Peter Pouliot <peter@pouliot.net>


Copyright and License
---------------------

Copyright (C) 2013 Peter J. Pouliot

Peter Pouliot can be contacted at: peter@pouliot.net

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 
