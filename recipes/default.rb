# encoding: UTF-8
#
# Cookbook Name:: sysstat
# Recipe:: default
#
# Copyright 2012-2014, John Dewey
#           2015,      Nick Hatch
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'sysstat' do
  action node['sysstat']['package_action'].to_sym
end

service 'sysstat' do
  supports restart: true, status: true

  action [:enable, :start]
end

template node['sysstat']['config_file'] do
  source 'sysstat-sysstat.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    sadc_options: node['sysstat']['sadc_options']
  )
  notifies :restart, 'service[sysstat]', :immediately
end

if platform? %w(debian ubuntu) # ~FC023

  template '/etc/default/sysstat' do
    source 'sysstat.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      enabled: node['sysstat']['enabled'],
      sa1_options: node['sysstat']['sa1_options'],
      sa2_options: node['sysstat']['sa2_options']
    )
    notifies :restart, 'service[sysstat]', :immediately
  end
end

if node['sysstat']['manage_cron']
  include_recipe 'sysstat::cron'
end
