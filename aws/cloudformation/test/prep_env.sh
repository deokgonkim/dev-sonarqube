#!/bin/bash

echo "export DB_HOST=localhost" > .env
echo "LDAP_URL(ex. ldaps://ldap.dgkim.net:636) : "; read LDAP_URL; echo "export LDAP_URL=${LDAP_URL}" >> .env
echo "LDAP_USER_BASE_DN(ex. ou=Users,dc=dgkim,dc=net) : "; read LDAP_USER_BASE_DN; echo "export LDAP_USER_BASE_DN=${LDAP_USER_BASE_DN}" >> .env
echo "LDAP_GROUP_BASE_DN(ex. ou=sonarqube,ou=Groups,dc=dgkim,dc=net) : "; read LDAP_GROUP_BASE_DN; echo "export LDAP_GROUP_BASE_DN=${LDAP_GROUP_BASE_DN}" >> .env

