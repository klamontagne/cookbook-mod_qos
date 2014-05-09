#
# Cookbook Name:: mod_qos
# Recipe:: default


include_recipe 'build-essential'
include_recipe 'apache2'

git "mod_qos" do
  action :sync
  repository "https://github.com/klamontagne/mod_qos.git"
  revision "3f746724b5b0859b0fcd17aac8a92b26706fb662"
  destination "/var/chef/cache/mod_qos"
end

package "apache2-prefork-dev"

execute "build mod_qos" do
  cwd "/var/chef/cache/mod_qos/apache2"
  command "apxs2 -i -c mod_qos.c -lcrypto -lpcre"
end

file "/etc/apache2/mods-available/qos.load" do
  content "LoadModule qos_module /usr/lib/apache2/modules/mod_qos.so"
end

apache_module "qos"
