memcached Cookbook
==================

Installs memcached and provides a LWRP to set up multiple instances of memcached on the same host.

WARNING: this cookbook restarts a memcached instance whenever its configuration is updated by Chef.

Requirements
------------

#### platforms
- `debian 7` - this memcached cookbook has been wrote for debian wheezy.

#### versions
- `memcached 1.4.13` - this memcached cookbook use configuration options only available with memcached 1.4.13 or higher.


Attributes
----------

#### memcached::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['memcached']['config_available']</tt></td>
    <td>Hash</td>
    <td>Defines all available memcached instance configurations</td>
    <td><tt>default</tt></td>
  </tr>
  <tr>
    <td><tt>['memcached']['config_enabled']</tt></td>
    <td>Array</td>
    <td>Defines memcached instances to configure on the node using parameters defined in config_available</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

#### \['memcached'\]\['config\_available'\]
```json
{
  "memcached": {
    "config_available": {
      "complete_example": {
        "bind": "0.0.0.0",
        "tcp_port": "11211",
        "max_memory": "32"
      },
      "another_instance": {
        "tcp_port": "11212"
      },
      "the_third_one": {
        "tcp_port": "11213"
      }
    }
  }
}
```

Usage
-----
#### memcached::default
Installs 2 memcached instances:
 * 'default' using memcached factory configuration.
 * 'test', listening on 127.0.0.1:11211 with 128Mb RAM allocated.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[memcached]"
  ],
  "memcached": {
    "config_enabled": [ "default", "test" ],
    "config_available": {
      "test": {
        "tcp_port": "11212",
        "max_memory": "128"
      }
    }
  }
}
```

`config\_available` and `config\_enabled` can be defined in a role and can be overrided at the environment level.

License and Authors
-------------------
Authors: vnz <vleraitre@gmail.com>
