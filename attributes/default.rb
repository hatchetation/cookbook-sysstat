# encoding: UTF-8
#
# Cookbook Name:: sysstat
# Recipe:: default
#
# Copyright 2012-2014, John Dewey
#           2015-, Nick Hatch
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

default['sysstat']['package_action'] = 'upgrade'

# some defaults, which may be tweaked per-platform
default['sysstat']['enabled'] = 'true' #FIXSTRING
default['sysstat']['manage_cron'] = true
default['sysstat']['sadc_options'] = '-S DISK'
default['sysstat']['config_file'] = '/etc/sysconfig/sysstat'
default['sysstat']['sa1_cmd'] = '/usr/lib64/sa/sa1'

case node['platform_family']
when 'debian'
  default['sysstat']['config_file'] = '/etc/sysstat/sysstat'
  default['sysstat']['sa1_cmd'] = 'debian-sa1'
  case node['platform_version'].to_f
  when 12.04
    default['sysstat']['sadc_options'] = ''
    default['sysstat']['sa1_options'] = '-S DISK'
    default['sysstat']['sa2_options'] = ''
  when 14.04
    default['sysstat']['sadc_options'] = '-S DISK'
  end
end
