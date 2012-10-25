# Cookbooks for RoundCube

## Vagrant setup

 * edit `dna.json-dist`
 * `vagrant up`
 * http://33.33.108.2/

## Server prep

The server should run Ubuntu Precise. Before starting, please ensure the latest updates have been applied.

 * `apt-get update`
 * `apt-get upgrade`
 * `apt-get dist-upgrade`
 * `apt-get install ruby1.9.3 make git`

### Ruby setup

 * setup `~/.gemrc`: `echo "gem: --no-ri --no-rdoc" > ~/.gemrc`
 * `gem install chef`

## Installation

 * set `live: true` in dna.json
 * `chef-solo -c /home/till/cookbooks/chef-solo/solo.rb`
