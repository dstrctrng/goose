require "vagrant-shell"
require "vagrant-shell/ssh-agent"

VagrantPlugins::Shell::Plugin.make_provider(:static)
VagrantPlugins::Shell::Plugin.make_provider(:docker)

Vagrant.configure("2") do |config|
  config.ssh.username = 'ubuntu'
  config.vm.box = ENV['box'] || ENV['BOX'] || "precise-clean"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :static do |static, override|
    override.vm.box = "static"
    static.image = 'localhost'
    static.script = static.find_script("static")
    override.ssh.username = ENV['LOGNAME']
  end

  config.vm.provider :virtualbox do |vbox, override|
    override.vm.base_mac = "auto"
    override.vm.synced_folder "vault", "/vault", disabled: false
  end

  config.vm.provider :docker do |docker, override|
    docker.image = 'precise:clean'
    docker.script = docker.find_script("docker")
    docker.run_args = %w(/sbin/init.orig)
  end
end
