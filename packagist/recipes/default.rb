include_recipe "packagist::vhost"

package "curl"
package "git-core"

if node.attribute?("live")
  include_recipe "packagist::deploy"
end

include_recipe "packagist::configure"

include_recipe "packagist::db"
include_recipe "packagist::cron"
