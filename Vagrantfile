Vagrant.configure('2') do |config|
  config.vm.define "plymouth_dev" , primary: true do |fe|
    fe.vm.box = 'opensuse/openSUSE-42.1-x86_64'
    fe.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "users"
    fe.vm.provision :shell, name: 'provision.sh', inline: '/vagrant/provision.sh'
  end

  config.vm.provider :virtualbox do |vb|
    vb.destroy_unused_network_interfaces = true
  end
end
