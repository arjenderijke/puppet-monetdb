#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

class monetdb::fedora_repo inherits monetdb::params {

  yumrepo {'MonetDB $releasever - $basearch':
    ensure   => present,
    name     => 'MonetDB $releasever - $basearch',
    baseurl  => 'http://dev.monetdb.org/downloads/Fedora/$releasever/$basearch/',
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
    target   => '/etc/yum.repos.d/monetdb.repo',
  }

}
