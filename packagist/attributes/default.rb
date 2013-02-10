default["packagist"]                = {}
default["packagist"]["root"]        = "/vagrant_data"
default["packagist"]["server_name"] = "plugins.roundcube.net"
default["packagist"]["socket"]      = "/var/run/php5-fpm.sock"
default["packagist"]["nginx"]       = "/etc/nginx"
default["packagist"]["email"]       = "plugins@roundcube.net"

default["packagist"]["ga"] = ""

default["packagist"]["smtp"] = {
    "hostname" => "127.0.0.1",
    "username" => "",
    "password" => ""
}

default["packagist"]["db"]            = {}
default["packagist"]["db"]["db_name"] = "packagist"

default["packagist"]["solr"]            = {}
default["packagist"]["solr"]["dsn"]     = "http://127.0.0.1:8080/solr/active"
default["packagist"]["solr"]["timeout"] = 5

# deploying live
default["packagist"]["live_root"]  = "/var/www"
default["packagist"]["repository"] = "git://github.com/roundcube/plugins.roundcube.net.git"
