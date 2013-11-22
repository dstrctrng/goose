require "vagrant-shell"
require "vagrant-shell/ssh-agent"

VagrantPlugins::Shell::Plugin.make_provider(:static)

Vagrant.configure("2") do |config|
  config.ssh.username = 'ubuntu'
  config.vm.box = "precise-clean"

  config.vm.provider :virtualbox do |vbox, override|
    override.vm.base_mac = "auto"
  end

  config.vm.provider :static do |shell, override|
    override.vm.box = "static"
    override.ssh.username = ENV['LOGNAME']
    shell.image = 'localhost'
    shell.script = shell.find_script("static")
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
end
