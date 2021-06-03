# Atlassian LDAP

Connect services of Atlassian with LDAP used for testing.

# Software
- Jira
- Postgres
- Docker
- Openldap
- Phpldapadmin

# Config
  1)
  ```
  Reeplace
  .env_EXAMPLE for .env
  Change values for .env
  ```
  2)

  ```
  docker-compose pull
  docker-compose config
  docker-compose up -d
  ```

# OpenIdap

  ## Access
  ```
  url: ldap.everis.local
  ```

  ## Credential:
  ```
  user: cn=admin,dc=ldap,dc=everis,dc=local
  pass: admin
  ```
  ## View logs:
  ```
    docker exec -it openldap bash -c "slapcat | more"
  ```

  ## Config login
    - Microsoft Active Directory
    - Read Only, with Local Groups

# Jira

  ## Access
  ```
  url: jira.everis.local
  ```

# Other
  ## Optional
  ### HTTPS
  1) Edit
  ```
  vim certgen.sh
  // Replace domain or subdomain
  ```
  

  2) Run
  ```
  ./certgen.sh
  ```