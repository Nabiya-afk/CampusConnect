FROM tomcat:9-jdk17-temurin-jammy

RUN sed -i 's/port="8080"/port="10000"/' /usr/local/tomcat/conf/server.xml

COPY CampusConnect1/dist/CampusConnect1.war /usr/local/tomcat/webapps/CampusConnect1.war

EXPOSE 10000
