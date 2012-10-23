apt_repository node['percona-server']['ppa'] do
  uri node['percona-server']['uri']
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key node['percona-server']['key']
end

node['percona-server']['packages'].each do |p|
  package p
end
