node["packagist"]["root"] = "#{node["packagist"]["live_root"]}/#{node["packagist"]["server_name"]}"

Chef::Log.info("Setting root to #{node["packagist"]["root"]}")

directories = [ node["packagist"]["root"], "#{node["packagist"]["root"]}/shared" ]

directories.each do |d|
  directory d do
    action    :create
    mode      "0750"
    owner     "www-data"
    group     "www-data"
    recursive true
  end
end

deploy node["packagist"]["root"] do
  action            :deploy
  repo              node["packagist"]["repository"]
  enable_submodules false
  migrate           false
  user              "www-data"
  revision          "master"

  symlinks                   Hash.new
  symlink_before_migrate     Hash.new
  create_dirs_before_symlink []

  before_symlink do
    template "#{release_path}/app/config/parameters.yml" do
      source "parameters.yml.erb"
      mode   "0644"
      variables({
        :db            => node["packagist"]["db"],
        :email         => node["packagist"]["email"],
        :server_name   => node["packagist"]["server_name"],
        :ga_key        => node["packagist"]["ga"],
        :github_client => node["github"]["client_id"],
        :github_secret => node["github"]["secret"],
        :secret        => node["packagist"]["secret"],
        :remember_me   => node["packagist"]["remember_me"],
        :smtp          => node["packagist"]["smtp"],
        :solr          => node["packagist"]["solr"]
      })
    end
    execute "curl -s https://getcomposer.org/installer | php" do
      cwd    release_path
      not_if do
        File.exists?("#{release_path}/composer.phar")
      end
    end

    execute "composer install" do
      command "./composer.phar install --prefer-source -n"
      cwd     release_path
    end

    execute "app/console doctrine:schema:create" do
      cwd            release_path
      ignore_failure true
    end

    execute "app/console assets:install web" do
      cwd release_path
    end
  end

  restart do
    execute "php-fpm cycle" do
      command "/etc/init.d/php5-fpm reload"
    end
  end
end
