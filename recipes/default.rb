# frozen_string_literal: true
#
# Cookbook Name:: demo_cookbook
# Recipe:: _linux
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


# run the correct linux bootstrap recipe
case node['platform_family']
when 'debian','ubuntu'
  include_recipe 'demo_cookbook::_deb'
when 'redhat', 'centos','fedora'
  include_recipe 'demo_cookbook::_rpm'
end
# run the correct windows bootstrap recipe
if platform?('windows')
  include_recipe 'demo_cookbook::_windows'
end
