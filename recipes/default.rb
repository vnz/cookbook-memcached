#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2014, Ebuzzing
#

package 'memcached'

file '/etc/memcached.conf' do
  action :delete
end

node['memcached']['config_enabled'].each do |instance|
  config = node['memcached']['config_available'][instance].to_hash
  Chef::Log.debug "Config: #{config}"

  memcached_instance instance do
    bind config['bind']
    tcp_port config['tcp_port']
    max_memory config['max_memory']
  end
end

service 'memcached' do
  supports :status => true, :restart => true
  action :enable
end

