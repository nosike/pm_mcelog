## The aim of this modules is to remove mcelog package in all Rhel servers.

class pm_mcelog {
$mcelog_present = mcelog_exists("/usr/sbin/mcelog")

#if $mcelog_exists == 1 {
#  fail("Package is already absent. Unpin node from node group.")
#}
#if $::osfamily == 'Windows' {
 #   fail("Operating system not supported")
#}
if $mcelog_present == 0 and $::osfamily == 'RedHat' {
  fail("Package is already absent. Unpin node from node group.")
}
elsif $mcelog_present == 1 and $::osfamily == RedHat {
package { 'mcelog':
  ensure => 'absent',
}
}
else {
fail("Operating system type is not supported")
}
}
