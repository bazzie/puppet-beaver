class beaver::service {

 case $beaver::enable {
   true: {
     $ensure_real = 'running'
     $enable_real = true
   }
   default: {
     $ensure_real = 'stopped'
     $enable_real = false
   }
  }
  service { 'beaver':
    ensure => $ensure_real,
    enable => $enable_real,
  }
}