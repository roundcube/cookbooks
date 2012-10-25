execute "app/console doctrine:schema:create" do
  cwd            node["packagist"]["root"]
  ignore_failure true  
end

execute "app/console assets:install web" do
  cwd node["packagist"]["root"]
end
