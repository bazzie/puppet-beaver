class beaver::install {
  
  package {'python-pip':
    ensure => present,
  }

  package { 'beaver':
    ensure => present,
    provider => 'pip',
    notify => Class['beaver::service'],
  }

  file { '/etc/init.d/beaver':
    ensure => file,
    mode => '0555',
    owner => 'root',
    group => 'root',
    content => template('beaver/beaver.init.erb'),
  }

  file { '/etc/beaver':
    ensure => 'directory',
    mode => '0555',
    owner => 'root',
    group => 'root',
  }

  file { '/etc/beaver/conf.d':
    ensure => 'directory',
    mode => '0555',
    owner => 'root',
    group => 'root',
    purge => true,
    force => true,
    recurse => true,
    notify => Class['beaver::service'],
  }


}