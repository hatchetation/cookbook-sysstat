# encoding: UTF-8
#
# Cookbook Name:: sysstat
# Recipe:: cron
#
# Copyright 2015, Nick Hatch
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

interval = 10
count = 6
sa1 = node['sysstat']['sa1_cmd']

cron_d 'sysstat' do
  command "#{sa1} #{interval} #{count}"
  path '/usr/lib/sysstat:/usr/sbin:/usr/sbin:/usr/bin:/sbin:/bin'
  user 'root'
end
