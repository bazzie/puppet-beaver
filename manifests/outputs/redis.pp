define beaver::output::redis(
  $host,
  $port      = 6379,
  $db        = 0,
) {

  if $host {
    validate_string($host)
  }

  if ! is_numeric($port) {
    fail("\"${port}\" Invalid value for parameter 'port'. Should be numeric.")
  }

  if ! is_numeric($db) {
    fail("\"${db}\" Invalid value for parameter 'db'. Should be numeric.")
  }

  $opt_url = "redis_url: redis://${host}:${port}/${db}\n"

  file_fragment{ "output_redis_${::fqdn}":
    tag     => "beaver_config_${::fqdn}",
    content => "${opt_url}\n",
    order   => 20
  }

}
