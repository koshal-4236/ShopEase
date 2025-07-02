# Use Maven to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY . ./
RUN mvn clean package -DskipTests

# Use Tomcat to deploy the WAR
FROM tomcat:10-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from previous stage
COPY --from=build /app/target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
