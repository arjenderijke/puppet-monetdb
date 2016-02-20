#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::install_repo inherits monetdb::params {

  case $::osfamily {
    'RedHat' : {
      file {'/etc/yum.repos.d/monetdb.repo':
        source => 'puppet:///modules/${module_name}/monetdb.repo',
        owner  => root,
        group  => root,
        mode   => '0644',
      }
    }
    default : {
      fail('Operating System not supported')
    }
  }
}
