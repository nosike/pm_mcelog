## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
$mce_package = 'mcelog'

if $mce_package == undef {
  warning("Package is already absent. Unpin node from node group.")
}else {

case $::osfamily {
  'RedHat':{
    fail("Operating system not supported")
}
  'Windows':{
package { 'mcelog':
  ensure => 'absent',

}
}
}
}
}
