define beaver::output::redis(
  $host,
  $port      = 6379,
  $db        = 0,
) {

  #### Validate parameters
  if $host {
    validate_string($host)
  }

  if ! is_numeric($port) {
    fail("\"${port}\" is not a valid port parameter value")
  }

  if ! is_numeric($db) {
    fail("\"${db}\" is not a valid db parameter value")
  }

  $opt_url = "redis_url: redis://${host}:${port}/${db}\n"

  file_fragment{ "output_redis_${::fqdn}":
    tag     => "beaver_config_${::fqdn}",
    content => "${opt_url}\n",
    order   => 20
  }

}
