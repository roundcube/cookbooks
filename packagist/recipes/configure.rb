# in vagrant, no deploy is necessary - the folder is an nfs share
template "#{node["packagist"]["root"]}/app/config/parameters.yml" do
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
