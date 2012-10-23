template "/tmp/mysql-setup.sql" do
  source "mysql.erb"
  mode   "0600"
  owner  "root"
  group  "root"
  variables({
    :db_name => node["packagist"]["db"]["db_name"]
  })
end

execute "mysql -u root < /tmp/mysql-setup.sql"

execute "app/console doctrine:schema:create" do
  cwd            node["packagist"]["root"]
  ignore_failure true  
end

execute "app/console assets:install web" do
  cwd node["packagist"]["root"]
end
