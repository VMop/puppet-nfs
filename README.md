# Puppet NFS

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)
* stdlib

## Usage

### Install NFS client tools

    node /box/ {
      include nfs
    }

### Install NFS client and server

    node /box/ {
      class { 'nfs':
        server => true;
      }
    }

### Export NFS shares

    node /box/ {
      class { 'nfs':
        server => true;
      }

      nfs::export { '/srv/nfs01 10.0.1.1/24':
        export  => '/srv/nfs01',
        host    => '10.0.1.1/24',
        options => 'rw,sync,no_root_squash',
      }

      nfs::export { '/srv/nfs01 10.0.2.1/24':
        export  => '/srv/nfs01',
        host    => '10.0.2.1/24',
        options => 'rw,sync,no_root_squash',
      }
    }

## Platform

* CentOS 6
* Debian (untested)

## Credit

Based on [Tom De Vylder puppet-nfs module] (https://github.com/arioch/puppet-nfs) with significant incompatible changes.
