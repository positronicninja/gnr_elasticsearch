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

service 'nginx' do
  supports status: true, restart: true, reload: true
  action :nothing
end

execute 'verify_nginx_conf' do
  command '`which nginx` -t'
  user 'root'
  action :nothing
  notifies :reload, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/elasticsearch' do
  to '/etc/nginx/sites-available/elasticsearch'
  notifies :run, 'execute[verify_nginx_conf]'
end
