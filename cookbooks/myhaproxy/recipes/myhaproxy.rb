
pool_members = search("node", "role:#{node['haproxy']['app_server_role']}") || []

pool_members << node if node.run_list.roles.include?(node['haproxy']['app_server_role'])

servers = pool_members.uniq.map do |m|
  "#{m[:hostname]} #{m[:ipaddress]}:#{m[:tomcat][:port]} weight 1 maxconn #{node['haproxy']['maxconn']} check"
end

package "haproxy" do
  action :install
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  variables({
    :servers => servers
  })
end

service "haproxy" do
  action :restart
end
