#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::install_repo inherits monetdb::params {

  file {'/etc/yum.repos.d/monetdb.repo':
    source => 'puppet:///monetdb.repo',
    user   => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
