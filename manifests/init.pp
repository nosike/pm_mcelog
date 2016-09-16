## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
#$mce_package = 'mcelog'

#if $mcelog_exists == 1 {
#  fail("Package is already absent. Unpin node from node group.")
#}
case $::osfamily {
  'Windows':{
    fail("Operating system not supported")
}
  'RedHat':{
if $mcelog_exists == 1 {
  fail("Package is already absent. Unpin node from node group.")
}

package { 'mcelog':
  ensure => 'absent',

}
}
}
}
