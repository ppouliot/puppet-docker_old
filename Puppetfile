# Docker Puppetfile 
#
# Git Settings
git_protocol=ENV['git_protocol'] || 'git'
base_url = "#{git_protocol}://github.com"

mod 'puppetlabs/apt', :git => "#{base_url}/puppetlabs/puppetlabs-apt"
mod 'puppetlabs/stdlib', :git => "#{base_url}/puppetlabs/puppetlabs-stdlib"
mod 'openstack-hyper-v/docker', :git => "#{base_url}/openstack-hyper-v/puppet-docker"
