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

  $enable = $beaver::params::enable,
  $package_name = $beaver::params::package_name,
  $package_provider = $beaver::params::package_provider,
  $python_version = $beaver::params::python_version,
  $home = $beaver::params::home,
  $venv = $beaver::params::venv,
  $user = $beaver::params::user,
  $group = $beaver::params::group,
  $version = $beaver::params::version,
  $redis_host = $beaver::params::redis_host,
  $redis_db = $beaver::params::redis_db,
  $redis_port = $beaver::params::redis_port,
  $redis_namespace = $beaver::params::redis_namespace,
  $queue_timeout = $beaver::params::queue_timeout,
  $logstash_version = $beaver::params::logstash_version,
  $enable_sincedb = $beaver::params::enable_sincedb,
  $sincedb_path = $beaver::params::sincedb_path,
  $multiline_regex_after = $beaver::params::multiline_regex_after,
  $multiline_regex_before = $beaver::params::multiline_regex_before,

) inherits beaver::params {
  
  class { 'beaver::install': } ->
  class { 'beaver::config': } ~>
  class { 'beaver::service': } ->
  Class['beaver']

}
