# == Class: beaver
#
# Full description of class beaver here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'beaver':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class beaver(

  $ensure = $beaver::params::ensure,
  $status = $beaver::params::status,
  $format = $beaver::params::format,
  $version       = false,
  $format        = 'json',
  $respawn_delay = 3,
  $max_failure   = 7,
  $hostname      = $::fqdn,
  $transport     = 'redis'
  $redis_host	= beaver::params::redis_host

) inherits beaver::params {
  
  class { 'beaver::install': } ->
  class { 'beaver::config': } ~>
  class { 'beaver::service': } ->
  Class['beaver']

}
