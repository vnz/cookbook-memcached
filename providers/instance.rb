# Support whyrun
def whyrun_supported?
  true
end

use_inline_resources

action :create do
  template "/etc/memcached_#{new_resource.name}.conf" do
    source 'memcached.conf.erb'
    mode 00644
    variables(
      :bind => new_resource.bind,
      :tcp_port => new_resource.tcp_port,
      :max_memory => new_resource.max_memory
    )
    notifies :restart, "service[memcached_#{new_resource.name}]"
  end

  service "memcached_#{new_resource.name}" do
    supports :status => true, :start => true, :stop => true, :restart => true, :reload => false, :enable => false
    start_command "/etc/init.d/memcached start #{new_resource.name}"
    stop_command "/etc/init.d/memcached stop #{new_resource.name}"
    restart_command "/etc/init.d/memcached restart #{new_resource.name}"
    status_command "/etc/init.d/memcached status #{new_resource.name}"
    action :start
  end
end

action :delete do
  file "/etc/memcached_#{new_resource.name}.conf" do
    action :delete
    notifies :stop, "service[memcached_#{new_resource.name}]"
  end
end
