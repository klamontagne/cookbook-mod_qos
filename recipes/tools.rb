#
# Cookbook Name:: mod_qos
# Recipe:: tools


include_recipe "mod_qos::default"

package "libpng12-0"
package "libpng12-dev"

execute "build mod_qos tools" do
  cwd "/var/chef/cache/mod_qos/tools"
  command "./configure && make"
end
