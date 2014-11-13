class beaver::config {

  file { '/etc/beaver/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  file_fragment { 'header':
    tag     => "beaver_config_${::fqdn}",
    content => "[beaver]\n${beaver::config}\n",
    order   => 10
  }

  file_concat { '/etc/beaver/beaver.conf':
    tag     => "beaver_config_${::fqdn}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['beaver'],
    require => File['/etc/beaver/']
  }

}

