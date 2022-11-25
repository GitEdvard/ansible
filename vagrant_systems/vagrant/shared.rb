require_relative "private_dns"

# The provisioning script we'll run on all of our Vagrant machines. We'll
# then provision the rest with Ansible
$shared_provision_script = <<SCRIPT
echo "Running initial provisioning so Ansible can run"
if command -v apt-get >/dev/null 2>&1; then
  if ! command -v python >/dev/null 2>&1; then
    sudo apt-get -y install python3
  fi
fi
SCRIPT

def shared_config(key, config)
    ip = $dns[key][:ip]
    config.vm.hostname = $dns[key][:name]
    config.vm.network "private_network", ip: ip

    # Default to ubuntu, can be overriden in the Vagrantfile
    config.vm.box = "ubuntu/trusty64"

    config.vm.provision :shell, :inline => $shared_provision_script
end
