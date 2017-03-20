# frozen_string_literal: true
#
# Cookbook Name:: demo_cookbook
# Recipe:: _deb
#
# Copyright 2017, JJ Asghar
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

apt = execute 'apt-get update' do
  action :nothing
end

if 'debian' == node['platform_family']
  if !File.exist?('/var/lib/apt/periodic/update-success-stamp')
    apt.run_action(:run)
  elsif File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86_400
    apt.run_action(:run)
  end
end

package 'vim' do
  action :install
end

package 'mg' do
  action :install
end

package 'nginx' do
  action :install
end

template "/var/www/html/index.nginx-debian.html" do
  source "index.html.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "nginx" do
  supports :status => true, :restart => true, :truereload => true
  action [ :enable, :start ]
end
