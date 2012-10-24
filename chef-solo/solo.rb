# requires sudo `chef-solo -c solo.rb`

file_cache_path "/var/chef-solo"
cookbook_path File.expand_path(File.dirname(File.dirname(__FILE__)))
json_attribs File.expand_path(File.dirname(File.dirname(__FILE__)) + "/dna.json")
role_path File.expand_path(File.dirname(__FILE__) + "/roles")
