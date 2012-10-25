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
