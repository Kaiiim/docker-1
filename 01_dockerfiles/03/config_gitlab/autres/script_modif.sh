#!/bin/bash

var1="external_url 'http://gitlab.example.com'"
var2="external_url 'https://gitlab.example.com'"
sed -i -e 's/'"$var1"'/'"$var2"'/g' /etc/gitlab/gitlab.rb
sed -i -e "s/external_url 'http:\/\/gitlab.example.com'/external_url 'https:\/\/gitlab.example.com'/g" /etc/gitlab/gitlab.rb


var1="external_url 'http:\/\/gitlab.example.com'"
var2="external_url 'https:\/\/gitlab.example.com'"
sed -i -e "s/$var1/$var2/g" /etc/gitlab/gitlab.rb


sed -i -e "s/# nginx\['ssl_certificate'\] = \'/etc/gitlab/ssl/#\{node\['fqdn'\]\}\.crt\'/ffffffffffffffffffff/g" /etc/gitlab/gitlab.rb

var1="# letsencrypt['enable'] = nil"
var2="letsencrypt['enable'] = true"
sed -i -e 's/'"$var1"'/'"$var2"'/g' /etc/gitlab/gitlab.rb

var1='# nginx['redirect_http_to_https'] = false'
var2='nginx['redirect_http_to_https'] = true'
sed -i -e 's/'"$var1"'/'"$var2"'/g' /etc/gitlab/gitlab.rb


