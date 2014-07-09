default['memcached']['config_enabled'] = nil
default['memcached']['config_available'] = {
  'default' => {
    'bind' => "127.0.0.1",
    'tcp_port' => "11211",
    'max_memory' => "128"
  }
}
