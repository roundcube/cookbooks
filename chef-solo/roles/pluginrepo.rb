name 'pluginrepo'
description 'Setup plugins.roundcube.net with this!'
run_list 'recipe[apt]', 'recipe[php5-ppa]', 'recipe[percona]', 'recipe[redis]', 'recipe[nginx]', 'recipe[packagist]'
