# class nfs::config
#
class nfs::config {
  if $::nfs::server {
    concat { $::nfs::conf['path']:
      owner  => $::nfs::conf['user'],
      group  => $::nfs::conf['group'],
      mode   => $::nfs::conf['mode'],
      notify => Service[$::nfs::svc['name']],
    }

    concat::fragment { 'nfs_export_header':
      target  => $::nfs::conf['path'],
      content => "# Managed by Puppet\n",
      order   => 00,
    }
  } else {
    file { $::nfs::conf['path']:
      ensure => absent,
    }
  }
}

