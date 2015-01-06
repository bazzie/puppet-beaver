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

) inherits beaver::params {
  
  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" invalid value for parameter 'ensure'. Valid parameters are: 'present absent'")
  }

  if ! ($status in [ 'enabled', 'disabled', 'running', 'unmanaged' ]) {
    fail("\"${status}\" invalid value for parameter 'status'. Valid parameters are: 'enabled disabled running unmanaged'")
  }

  if ! ($format in [ 'json', 'msgpack', 'string', 'raw' ]) {
    fail("\"${format}\" invalid value for parameter 'format'. Valid parameters are: 'json msgpak string raw")
  }

  if ! is_numeric($respawn_delay) {
    fail("\"${respawn_delay}\" is not a valid respawn_delay value")
  }

  if ! is_numeric($max_failure) {
    fail("\"${max_failure}\" invalid value for max_failure parameter")
  }

  validate_string($hostname)

  if ! ($transport in [ 'redis', 'rabbitmq', 'zmq', 'udp', 'mqtt', 'sqs' ]) {
    fail("\"${transport}\"  invalid value for parameter 'transport'. Valid parameters are: 'redis rabbitmq zmq udp mqtt sqs'")
  }

  class { 'beaver::install': } ->
  class { 'beaver::config': } ~>
  class { 'beaver::service': } ->
  Class['beaver']

}
