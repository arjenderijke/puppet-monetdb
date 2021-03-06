#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#

define monetdb::fedora_repo (
  $enable_debug = $monetdb::params::enable_debug,
  $enable_source = $monetdb::params::enable_source,
  $enable_testing = $monetdb::params::enable_testing,
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

  if ($enable_testing) {
    yumrepo {'monetdb-testing':
      ensure   => present,
      name     => "MonetDB Testing ${::operatingsystemrelease} - ${::architecture}",
      baseurl  => "http://dev.monetdb.org/downloads/testing/Fedora/${::operatingsystemrelease}/${::architecture}/",
      enabled  => true,
      gpgcheck => true,
      gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
      target   => '/etc/yum.repos.d/monetdb.repo',
    }

    if ($enable_debug) {
      yumrepo {'monetdb-testing-debuginfo':
        ensure   => present,
        name     => "MonetDB Testing Debug ${::operatingsystemrelease} - ${::architecture}",
        baseurl  => "http://dev.monetdb.org/downloads/testing/Fedora/debug/${::operatingsystemrelease}/${::architecture}/",
        enabled  => true,
        gpgcheck => true,
        gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
        target   => '/etc/yum.repos.d/monetdb.repo',
      }
    }

    if ($enable_source) {
      yumrepo {'monetdb-testing-source':
        ensure   => present,
        name     => "MonetDB Testing Source ${::operatingsystemrelease} - ${::architecture}",
        baseurl  => 'http://dev.monetdb.org/downloads/testing/Fedora/source/',
        enabled  => true,
        gpgcheck => true,
        gpgkey   => 'https://www.monetdb.org/downloads/MonetDB-GPG-KEY',
        target   => '/etc/yum.repos.d/monetdb.repo',
      }
    }
  }
}
