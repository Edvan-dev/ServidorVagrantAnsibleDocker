Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.box_version = "202502.21.0"

  # Define o provedor (VirtualBox) 
  config.vm.provider "virtualbox" do |vb|
    # Configurações específicas do VirtualBox
    vb.name = "EdvanOliveira"  # Nome da VM no VirtualBox
    vb.memory = 2048       # Memória RAM alocada (2 GB)
    vb.cpus = 2            # Número de CPUs
  end

  # Configura uma rede privada com IP estático
  config.vm.network "private_network", ip: "192.168.57.10"

  # Sincroniza uma pasta do host com a VM
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
  end
end
