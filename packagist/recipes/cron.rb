commands=["packagist:update --no-debug --env=prod", "packagist:dump --no-debug --env=prod", "packagist:index --no-debug --env=prod", "packagist:stats:compile --no-debug --env=prod", "packagist:stats --no-debug --env=prod"]

if node.attribute?("live") and node["live"] == true
  app_root = "#{node["packagist"]["live_root"]}/#{node["packagist"]["server_name"]}/current"
else
  app_root = node["packagist"]["root"]
end

commands.each do |command|
  cron command do
    mailto  node["packagist"]["email"]
    user    "www-data"
    minute  "*/10"
    command "cd #{app_root} && app/console #{command}"
  end
end
