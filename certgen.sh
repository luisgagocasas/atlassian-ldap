#!/bin/bash
mkdir -p certs && cd $_
mkcert -install
mkcert -key-file jira.everis.local.key -cert-file jira.everis.local.crt jira.everis.local *.jira.everis.local
mkcert -key-file ldap.everis.local.key -cert-file ldap.everis.local.crt ldap.everis.local *.ldap.everis.local
mkcert -key-file wordpress.everis.local.key -cert-file wordpress.everis.local.crt wordpress.everis.local *.wordpress.everis.local
mkcert -key-file pma.everis.local.key -cert-file pma.everis.local.crt pma.everis.local *.pma.everis.local