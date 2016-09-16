## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
#$mce_package = 'mcelog'

#if $mcelog_exists == 1 {
#  fail("Package is already absent. Unpin node from node group.")
#}
if $::osfamily == 'Windows' {
    fail("Operating system not supported")
}
if $::osfamyly == 'RedHat' and $mcelog_exists == 1 {
  fail("Package is already absent. Unpin node from node group.")
}elsif $::osfamily == 'RedHat' and $mcelog_exists == 0 {
package { 'mcelog':
  ensure => 'absent',
}
}
}
