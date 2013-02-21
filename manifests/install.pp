# class nfs::install
#
class nfs::install {

  package { $::nfs::pkg['client']:
    ensure => $::nfs::pkg['ensure'],
  }

  if $::nfs::server {
    package { $::nfs::pkg['server']:
      ensure => $::nfs::pkg['ensure'],
    }
  }
}
