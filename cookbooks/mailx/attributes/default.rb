case node['platform_family']
when 'debian'
  default['mailutils']['mailx-package'] = 'mailutils'
when 'rhel', 'centos'
  default['mailutils']['mailx-package'] = 'mailx'
end
