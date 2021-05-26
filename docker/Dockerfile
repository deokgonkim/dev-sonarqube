FROM sonarqube:8.9.0-community

RUN apk update && apk add gettext

COPY opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]