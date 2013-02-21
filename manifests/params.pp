# class nfs::params
#
class nfs::params {

  $config = {
    'path'  => '/etc/exports',
    'owner' => 'root',
    'group' => 'root',
    'mode'  => '0644',
  }

  $package = {
    'ensure' => 'present',
  }

  $service = {
    'enable' => true,
    'ensure' => running,
  }

  case $::osfamily {
    'RedHat': {
      $package['client'] = 'nfs-utils'
      $package['server'] = 'rpcbind'
      $service['name']   = ['nfs', 'nfslock']
      $service['rpc']    = 'rpcbind'
      # client should also run nfslock service:
      # https://access.redhat.com/knowledge/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/s1-nfs-start.html
      $service['client'] = 'nfslock'
    }

    'Debian': {
      $package['client'] = 'nfs-common'
      $package['server'] = 'nfs-kernel-server'
      $service['name']   = 'nfs-kernel-server'
      $service['rpc']    = 'portmap'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }
}
