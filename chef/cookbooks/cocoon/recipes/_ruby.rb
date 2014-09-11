#
# Cookbook Name:: cocoon
# Recipe:: _ruby
#
# Copyright (C) 2014 FullStack
#

#
# Install Ruby Build Dependencies
#
package 'libxslt-dev'
package 'libxml2-dev'
package 'build-essential'
package 'libpq-dev'
package 'libsqlite3-dev'

#
# Add apt-add-repository.
#
package 'software-properties-common'

#
# Add brightbox ruby repo.
#
execute 'apt-add-repository ppa:brightbox/ruby-ng -y' do
  not_if 'which ruby | grep -c 2.1'
end

#
# Update dependencies.
#
execute 'apt-get update' do
  ignore_failure true
end

#
# Install Ruby 2.1
#
package 'ruby2.1'
package 'ruby2.1-dev'

#
# Install Bundler, build it against the newly installed 2.1 gem binary
#
gem_package 'bundler' do
  gem_binary('/usr/bin/gem2.1')
end

#
# Install yajl-ruby, required for re-provisioning Chef.
#
gem_package 'yajl-ruby' do
  gem_binary('/usr/bin/gem2.1')
end

#
# Install Rails.
#
gem_package 'rails' do
  gem_binary('/usr/bin/gem2.1')
end
