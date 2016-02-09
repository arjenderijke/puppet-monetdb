#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::install_repo inherits monetdb::params {

  file {'/etc/yum.repos.d/monetdb.repo':
    source => 'puppet:///modules/monetdb.repo',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
