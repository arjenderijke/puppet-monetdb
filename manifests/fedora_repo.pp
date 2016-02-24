#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

define monetdb::fedora_repo (
  $enable_debug = $monetdb::params::enable_debug,
) {

  yumrepo {'monetdb':
    ensure   => present,
    name     => "MonetDB $::operatingsystemrelease - $::architecture",
    baseurl  => "http://dev.monetdb.org/downloads/Fedora/$::operatingsystemrelease/$::architecture/",
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
    target   => '/etc/yum.repos.d/monetdb.repo',
  }

}
