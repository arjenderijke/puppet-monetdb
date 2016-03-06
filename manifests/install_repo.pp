#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::install_repo inherits monetdb::params {

  case $::osfamily {
    'RedHat' : {
      fedora_repo {'monetdb_fedora_repo':
        enable_debug   => $::monetdb::params::enable_debug,
        enable_source  => $::monetdb::params::enable_source,
        enable_testing => $::monetdb::params::enable_testing,
      }

      file {'/etc/yum.repos.d/monetdb.repo':
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Fedora_repo['monetdb_fedore_repo'],
      }
    }
    default : {
      fail('Operating System not supported')
    }
  }
}
