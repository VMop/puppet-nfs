# = Define nfs::export
#
define nfs::export (
  $host,
  $export  = $name,
  $ensure  = present,
  $options = 'rw,no_root_squash,no_subtree_check',
) {

  if ! $::nfs::server {
    fail 'NFS server is not enabled.'
  }

  if $options {
    $content = "# ${name}\n${export} ${host}(${options})\n"
  } else {
    $content = "# ${name}\n${export} ${host}\n"
  }

  concat::fragment { "export_${name}":
    ensure  => $ensure,
    target  => $::nfs::conf['path'],
    content => $content,
    order   => 10,
  }
}
