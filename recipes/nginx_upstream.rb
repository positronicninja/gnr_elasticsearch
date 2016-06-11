#
# Cookbook Name:: gnr_elasticsearch
# Recipe:: nginx_upstream
#
# Copyright 2016, Gryphon & Rook Inc
#
# All rights reserved
#

template '/etc/nginx/sites-available/elasticsearch' do
  source 'elasticsearch_upstream.erb'
  user 'root'
  group 'root'
  mode '644'
end

link '/etc/nginx/sites-enabled/elasticsearch' do
  to '/etc/nginx/sites-available/elasticsearch'
end

service 'nginx' do
  action :reload
end
