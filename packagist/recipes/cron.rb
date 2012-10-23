commands=["packagist:update --no-debug --env=prod", "app/console packagist:dump --no-debug --env=prod"]
# solr: packagist:index --no-debug --env=prod

commands.each do |command|
  cron command do
    mailto  node["packagist"]["email"]
    user    "www-data"
    minute  "*/2"
    command "#{node["packagist"]["root"]}/app/console #{command}"
  end
end
