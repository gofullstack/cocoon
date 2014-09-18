#
# Cookbook Name:: cocoon
# Recipe:: _elixir
#
# Copyright (C) 2014 FullStack
#

include_recipe 'cocoon::_postgres'

#
# Download Erlang repo.
#
remote_file '/home/vagrant/erlang.deb' do
  source 'http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb'
  not_if 'which elixir'
end

#
# Add Erlang repo.
#
execute 'dpkg -i erlang.deb' do
  cwd '/home/vagrant'
  not_if 'which elixir'
end

#
# Update dependencies.
#
execute 'apt-get update' do
  ignore_failure true
end

#
# Install Erlang packages require by Elixir.
#
package 'erlang-ssl'
package 'erlang-inets'

#
# Install Elixir.
#
package 'elixir'
