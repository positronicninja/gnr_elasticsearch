#
# Cookbook Name:: gnr_elasticsearch
# Recipe:: install
#
# Copyright 2016, Gryphon & Rook Inc
#
# All rights reserved
#

remote_file "/tmp/elasticsearch-#{node[:elasticsearch][:version]}.deb" do
  source "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-#{node[:elasticsearch][:version]}.deb"
  mode '0755'
end

dpkg_package "/tmp/elasticsearch-#{node[:elasticsearch][:version]}.deb" do
  action :install
end

execute 'start_elasticsearch' do
  command '/etc/init.d/elasticsearch start'
  user 'root'
  action :nothing
end

execute 'setup service' do
  command 'update-rc.d elasticsearch defaults 95 10'
  user 'root'
  action :run
  notifies :run, 'execute[start_elasticsearch]'
end
