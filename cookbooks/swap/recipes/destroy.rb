#
# Cookbook Name:: swap
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

swap_file "/pagefile.sys" do
  action :destroy
end
