class beaver::install {
  
  package {'python-pip':
    ensure => present,
  }

  package { 'beaver':
    ensure => present,
    provider => 'pip',
    notify => Class['beaver::service'],
  }


}