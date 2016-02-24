# == Class: monetdb
#
# Full description of class monetdb here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { monetdb:
#    install_clients => [ 'php', 'odbc' ]
#  }
#
# === Authors
#
# Arjen de Rijke <arjenderijke@gmail.com>
#
# === Copyright
#
# Copyright 2015 Arjen de Rijke
#
class monetdb (
  $install_repo    = $monetdb::params::install_repo,
  $install_clients = $monetdb::params::install_clients,
  $install_devel   = $monetdb::params::install_devel,
  $enable_service  = $monetdb::params::enable_service,
  $dbfarm          = $monetdb::params::dbfarm,
  $user            = $monetdb::params::user,
  $password        = $monetdb::params::password,
  $enable_debug    = $monetdb::params::enable_debug,
) inherits monetdb::params {
  validate_bool($install_repo)
  validate_array($install_clients)
  validate_bool($install_devel)
  validate_bool($enable_service)
  validate_bool($enable_debug)

  if ($dbfarm == undef) {
    $dbfarm_dir = '/var/lib/monetdb/dbfarm'
  }
  validate_absolute_path($dbfarm_dir)
  validate_string($password)

  #change to contain
  anchor { 'monetdb::begin': } ->
    class { '::monetdb::install_repo': } ->
    class { '::monetdb::install': } ->
    class { '::monetdb::config': } ~>
    class { '::monetdb::service': } ->
  anchor { 'monetdb::end': }
}
