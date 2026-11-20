
FROM tomcat:9-jdk17-temurin-jammy

COPY CampusConnect1/dist/CampusConnect1.war /usr/local/tomcat/webapps/CampusConnect1.war

EXPOSE 8080
