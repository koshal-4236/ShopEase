# Use official Tomcat base image with JDK 17
FROM tomcat:10-jdk17

# Clean default webapps (optional, but recommended)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file and rename it to ROOT.war for clean URL
COPY target/shopping-ecom.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for external access
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
