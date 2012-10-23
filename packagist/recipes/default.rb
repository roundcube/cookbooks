include_recipe "packagist::vhost"

package "curl"
package "git-core"

include_recipe "packagist::vagrant"
include_recipe "packagist::db"
