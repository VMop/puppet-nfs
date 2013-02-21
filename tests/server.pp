class {'nfs':
  server => true,
}

nfs::export { 'home':
  export => '/export/home',
  host   => '192.168.1.1/24',
}
