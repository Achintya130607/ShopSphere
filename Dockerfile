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
COPY --from=build /app/web/target/shopsphere.war webapps/shopsphere.war

EXPOSE 10000

CMD sh -c 'PORT=; sed -i "s/port=\"8080\"/port=\"\\"/" /usr/local/tomcat/conf/server.xml; exec catalina.sh run'
