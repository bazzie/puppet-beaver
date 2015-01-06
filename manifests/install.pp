class beaver::install {
  
  package {'python-pip':
    ensure => present,
  }

  package { $package_name:
    ensure => present,
    provider => package_provider,
    notify => Class['beaver::service'],
  }


}