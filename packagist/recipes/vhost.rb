conf = node["packagist"]["nginx"]

if node.attribute?("live") and node["live"] == true
  docroot = "#{node["packagist"]["live_root"]}/#{node["packagist"]["server_name"]}/current"
else 
  docroot = node["packagist"]["root"]
end

template "#{conf}/sites-available/#{node["packagist"]["server_name"]}" do
  source "vhost.erb"
  mode   "0644"
  owner  "www-data"
  group  "www-data"
  variables({
    :listen      => 80,
    :root        => docroot,
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
