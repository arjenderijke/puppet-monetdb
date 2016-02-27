#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

define monetdb::fedora_repo (
  $enable_debug = $monetdb::params::enable_debug,
  $enable_source = $monetdb::params::enable_source,
) {

  yumrepo {'monetdb':
    ensure   => present,
    name     => "MonetDB ${::operatingsystemrelease} - ${::architecture}",
    baseurl  => "http://dev.monetdb.org/downloads/Fedora/${::operatingsystemrelease}/${::architecture}/",
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
    target   => '/etc/yum.repos.d/monetdb.repo',
  }

  if ($enable_debug) {
    yumrepo {'monetdb-debuginfo':
      ensure   => present,
      name     => "MonetDB Debug ${::operatingsystemrelease} - ${::architecture}",
      baseurl  => "http://dev.monetdb.org/downloads/Fedora/debug/${::operatingsystemrelease}/${::architecture}/",
      enabled  => true,
      gpgcheck => true,
      gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
      target   => '/etc/yum.repos.d/monetdb.repo',
    }
  }

  if ($enable_source) {
    yumrepo {'monetdb-source':
      ensure   => present,
      name     => "MonetDB Source ${::operatingsystemrelease} - ${::architecture}",
      baseurl  => 'http://dev.monetdb.org/downloads/Fedora/source/',
      enabled  => true,
      gpgcheck => true,
      gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
      target   => '/etc/yum.repos.d/monetdb.repo',
    }
  }
}
