use_inline_resources

def escape_resource(name)
  name.gsub('/', '_')
end

action :create do
  log "start provider in swap create #{new_resource.name}"

  resource_name = escape_resource(new_resource.file_name)

  execute "create#{resource_name}" do
    command "dd if=/dev/zero of=#{new_resource.file_name} bs=1024 count=#{new_resource.blocks}"
    not_if { ::File.exists?(new_resource.file_name) }
    notifies :run, "execute[mkswap#{resource_name}]", :immediately
  end

  execute "mkswap#{resource_name}" do
    command "mkswap #{new_resource.file_name}"
    action :nothing
  end

  execute "swapon#{resource_name}" do
    command "swapon #{new_resource.file_name}"
    not_if "grep -q #{new_resource.file_name} /proc/swaps"
  end
end

action :destroy do
  log "start provider in swap destroy #{new_resource.name}"

  resource_name = escape_resource(new_resource.file_name)

  execute "destory #{resource_name}" do
    command "swapoff #{new_resource.file_name}"
    only_if { "cat /proc/swaps | grep -q #{new_resource.file_name}".to_i == 1 }
  end

  file new_resource.file_name do
    action :delete
  end
end
