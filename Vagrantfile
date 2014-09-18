Vagrant.configure('2') do |config|
  config.vm.box = 'chef/ubuntu-14.04'
  config.omnibus.chef_version = :latest

  config.vm.network :private_network, type: 'dhcp'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder './code', '/home/vagrant/code', nfs: true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['chef/cookbooks']
    chef.add_recipe "recipe[cocoon::#{ENV.fetch('RECIPE', 'default')}]"
  end
end
