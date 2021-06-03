#!/bin/bash
mkdir -p certs && cd $_
mkcert -install
mkcert -key-file jira.everis.local.key -cert-file jira.everis.local.crt jira.everis.local *.jira.everis.local
mkcert -key-file ldap.everis.local.key -cert-file ldap.everis.local.crt ldap.everis.local *.ldap.everis.local