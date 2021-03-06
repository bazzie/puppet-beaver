class beaver::config(

  $redis_host = beaver::redis_host

){

  file { '/etc/beaver.conf':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0444',
    content => template('beaver/beaver.conf.erb'),
    notify => Class['beaver::service']
  }

}

