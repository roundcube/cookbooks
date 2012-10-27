include_recipe "packagist::vhost"

# lolbuntu - remove this
packages = ["whoopsie", "landscape-common"]
packages.each do |p|
  package p do
    action :remove
  end
end

package "htop"
package "curl"
package "git-core"

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

if node.attribute?("live") && node["live"] == true
  include_recipe "packagist::deploy"
else
  include_recipe "packagist::configure"
  include_recipe "packagist::composer"
  include_recipe "packagist::db"
end

include_recipe "packagist::cron"
