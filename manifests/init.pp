## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
$mce_package = 'mcelog'

if $mcelog_exist == 'false' {
  fail("Package is already absent. Unpin node from node group.")
}
case $::osfamily {
  'Windows':{
    fail("Operating system not supported")
}
  'RedHat':{
package { 'mcelog':
  ensure => 'absent',

}
}
}
}
