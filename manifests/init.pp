## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
$mce_package = 'mcelog'

if $mce_package == 'present' {
  fail("Package is already present. Unpin node from node group.")
}

case $::osfamily {
  'Windows':{
    fail("Operating system not supported")
}
  'RedHat':{
package { 'mcelog':
  ensure => 'present',

}
}
}
}
