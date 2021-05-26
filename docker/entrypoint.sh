#!/bin/bash

# Verify configuration
VARS='$DB_HOST:$LDAP_URL:$LDAP_USER_BASE_DN:$LDAP_GROUP_BASE_DN'
envsubst "$VARS" < /opt/sonarqube/conf/sonar.properties > /tmp/sonar.properties && cat /tmp/sonar.properties > /opt/sonarqube/conf/sonar.properties && cat /opt/sonarqube/conf/sonar.properties

echo "Making symbolic link for data"
if [ ! -d /data/data ]; then
    mv /opt/sonarqube/data /data/data
fi
ln -s /data/data /opt/sonarqube/data

echo "Making symbolic link for logs"
if [ ! -d /data/logs ]; then
    mv /opt/sonarqube/logs /data/logs
fi
ln -s /data/logs /opt/sonarqube/logs

echo "Making symbolic link for extensions"
if [ ! -d /data/extensions ]; then
    mv /opt/sonarqube/extensions /data/extensions
fi
ln -s /data/extensions /opt/sonarqube/extensions

/opt/sonarqube/bin/run.sh -Dsonar.search.javaAdditionalOpts=-Dnode.store.allow_mmap=false
