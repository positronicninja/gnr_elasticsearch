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
