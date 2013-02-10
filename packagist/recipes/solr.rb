files = ["protwords.txt", "schema.xml", "solrconfig.xml", "stopwords.txt", "synonyms.txt"]
conf  = "/opt/solr/core1/conf"

files.each do |file|
  cookbook_file "#{conf}/#{file}" do
    source file
    owner "root"
    group "root"
    mode "0644"
  end
end

cookbook_file "#{conf}/lang/stopwords_en.txt" do
  source "stopwords.txt"
  owner "root"
  group "root"
  mode "0644"
end
