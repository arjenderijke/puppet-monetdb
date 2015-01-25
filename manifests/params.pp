#
# monetdb::params
#

class monetdb::params {
  install_repo    = true
  install_clients = []
  install_devel   = false
  enable_service  = true
  dbfarm          = undef
  user            = 'monetdb'
  password        = 'monetdb'
}
