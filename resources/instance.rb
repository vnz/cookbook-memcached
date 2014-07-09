actions :create, :delete
default_action :create

attribute :name,        :kind_of => String,
  :name_attribute => true,
  :required => true

attribute :bind,        :kind_of => String, :default => "127.0.0.1"
attribute :tcp_port,    :kind_of => String, :default => "11211"
attribute :max_memory,  :kind_of => String, :default => "64"
