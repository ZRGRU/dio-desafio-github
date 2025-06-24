# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "ip" => "240", "image" => "bento/ubuntu-22.04"},
  "node01" => {"memory" => "512", "cpu" => "1", "ip" => "241", "image" => "bento/ubuntu-22.04"}#,
  # "node02" => {"memory" => "512", "cpu" => "1", "ip" => "242", "image" => "bento/ubuntu-22.04"},
  # "node03" => {"memory" => "512", "cpu" => "1", "ip" => "243", "image" => "bento/ubuntu-22.04"},
  # "node04" => {"memory" => "512", "cpu" => "1", "ip" => "244", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      config.ssh.insert_key = false
      config.ssh.password = "vagrant"
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.0.0.#{conf["ip"]}"
      machine.vm.provider "vmware" do |vmware|
        vmware.vmx["name"] = "#{name}"
        vmware.vmx["memsize"] = "#{conf["memory"]}"
        vmware.vmx["numvcpus"] = "#{conf["cpu"]}"
        vmware.vmx["ip"] = "10.0.0.#{conf["ip"]}"
      end
      machine.vm.provision "shell", path: "docker_install.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master_config.sh"
        machine.vm.provision "shell", path: "volume_consistency_server.sh"
      else
        machine.vm.provision "shell", path: "worker_config.sh"
        machine.vm.provision "shell", path: "volume_consistency_client.sh"
      end

    end
  end
end
