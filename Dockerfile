FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY web/pom.xml web/pom.xml
COPY swing-admin/pom.xml swing-admin/pom.xml

COPY web web
COPY swing-admin swing-admin

RUN mvn clean package -DskipTests

FROM tomcat:11.0.25-jdk17-temurin

RUN rm -rf webapps/*

COPY --from=build /app/web/target/shopsphere.war webapps/ROOT.war

RUN printf '#!/bin/sh\nPORT=\\nsed -i "s/port=\"8080\"/port=\"\\"/" /usr/local/tomcat/conf/server.xml\nexec catalina.sh run\n' > /usr/local/tomcat/start.sh && chmod +x /usr/local/tomcat/start.sh

EXPOSE 10000

CMD ["/usr/local/tomcat/start.sh"]
