FROM tomcat:10-jdk17

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file as ROOT.war to auto-deploy
COPY target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
