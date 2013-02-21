# class nfs
#
class nfs (
  $config  = {},
  $package = {},
  $service = {},
  $server  = false
) inherits ::nfs::params {

  $conf = merge($nfs::params::config, $config)
  $pkg  = merge($nfs::params::package, $package)
  $svc  = merge($nfs::params::service, $service)

  include nfs::install
  include nfs::config
  include nfs::service

  Class['::nfs::install'] ->
  Class['::nfs::config'] ~>
  Class['::nfs::service'] ->
  Class['::nfs']
}
