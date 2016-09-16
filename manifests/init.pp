## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
$mce_package = 'mcelog'

if $mce_package == 'absent': {
  warning("Package is already absent. Unpin node from node group.")
}else {

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
}
