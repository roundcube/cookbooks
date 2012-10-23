apt_repository node['php5-ppa']['ppa'] do
  uri node['php5-ppa']['uri']
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key node['php5-ppa']['key']
end

node['php5-ppa']['packages'].each do |p| 
  package p
end
