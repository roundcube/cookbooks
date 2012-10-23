Vagrant::Config.run do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "33.33.108.2"

  # config.vm.network :bridged

  config.vm.share_folder "v-data", "/vagrant_data", "../packagist", :nfs => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./"
    #chef.roles_path = "../my-recipes/roles"
    #chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_recipe "apt"
    chef.add_recipe "php5-ppa"
    chef.add_recipe "percona"
    chef.add_recipe "redis"
    chef.add_recipe "nginx"
    chef.add_recipe "packagist"
  
    # You may also specify custom JSON attributes:
    if File.exists?("./dna.json")
      chef.json.merge!(JSON.parse(File.read("./dna.json"))) 
    end
    chef.log_level = :debug
  end

end
