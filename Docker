FROM tomcat:10-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/shopping-ecom.war /usr/local/tomcat/webapps/shopping-ecom.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
