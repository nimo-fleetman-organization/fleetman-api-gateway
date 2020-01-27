FROM openjdk:8u131-jdk-alpine

MAINTAINER Richard Chesterwood "contact@virtualpairprogrammers.com"

EXPOSE 8080

WORKDIR /usr/share/automation

COPY target/fleetman-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java", "-Xmx50m","-jar","webapp.jar"]
