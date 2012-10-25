conf = node["packagist"]["nginx"]

if node.attribute?("live") and node["live"] == true
  docroot = "#{node["packagist"]["live_root"]}/#{node["packagist"]["server_name"]}/current"
  router  = "app.php"
else 
  docroot = node["packagist"]["root"]
  router  = "app_dev.php"
end

template "#{conf}/sites-available/#{node["packagist"]["server_name"]}" do
  source "vhost.erb"
  mode   "0644"
  owner  "www-data"
  group  "www-data"
  variables({
    :listen      => 80,
    :root        => docroot,
    :router      => router,
    :server_name => node["packagist"]["server_name"],
    :socket      => node["packagist"]["socket"]
  })
end

link "#{conf}/sites-enabled/#{node["packagist"]["server_name"]}" do
  to "#{conf}/sites-available/#{node["packagist"]["server_name"]}"
end

service "nginx" do
  action :reload
end
