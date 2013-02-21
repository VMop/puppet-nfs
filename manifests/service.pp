# class nfs::service
#
class nfs::service {
  if $::nfs::server {
    service { $::nfs::svc['rpc']:
      ensure => $::nfs::svc['ensure'],
      enable => $::nfs::svc['enable'],
    }

    service { $::nfs::svc['name']:
      ensure  => $::nfs::svc['ensure'],
      enable  => $::nfs::svc['enable'],
      require => Service[$::nfs::svc['rpc']],
    }
  } elsif $::nfs::svc['client'] {
    service { $::nfs::svc['rpc']:
      ensure => $::nfs::svc['ensure'],
      enable => $::nfs::svc['enable'],
    }

    service { $::nfs::svc['client']:
      ensure  => $::nfs::svc['ensure'],
      enable  => $::nfs::svc['enable'],
      require => Service[$::nfs::svc['rpc']],
    }
  }
}
