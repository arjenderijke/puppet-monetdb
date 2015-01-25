#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::service inherits monetdb::params {
  service { 'monetdbd':
    ensure => running,
    enable => true,
    }
}
