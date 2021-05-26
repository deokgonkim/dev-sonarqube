#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Prepare .env file before deploying"
    exit 1
fi


aws cloudformation \
deploy \
--template-file cloudformation.yml \
--stack-name sonarqube-test \
--capabilities CAPABILITY_NAMED_IAM \
--parameter-overrides \
"DbHost=$DB_HOST" \
"LdapUrl=$LDAP_URL" \
"LdapUserBaseDn=$LDAP_USER_BASE_DN" \
"LdapGroupBaseDn=$LDAP_GROUP_BASE_DN"
