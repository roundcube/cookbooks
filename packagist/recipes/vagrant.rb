# in vagrant, no deploy is necessary - the folder is an nfs share
template "#{node["packagist"]["root"]}/app/config/parameters.yml" do
  source "parameters.yml.erb"
  mode   "0644"
  variables({
    :db            => node["packagist"]["db"],
    :server_name   => node["packagist"]["server_name"],
    :github_client => node["github"]["client_id"],
    :github_secret => node["github"]["secret"],
    :secret        => node["packagist"]["secret"],
    :remember_me   => node["packagist"]["remember_me"]
  })
end

execute "curl -s https://getcomposer.org/installer | php" do
  cwd node["packagist"]["root"]
  not_if do
    File.exists?("#{node["packagist"]["root"]}/composer.phar")
  end
end

execute "./composer.phar install -n --no-ansi --prefer-dist" do
  cwd node["packagist"]["root"]
  user "vagrant"
end
