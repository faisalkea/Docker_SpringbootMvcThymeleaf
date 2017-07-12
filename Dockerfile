FROM maven:latest

#Author of the Docker File
MAINTAINER Faisal Jarkass

WORKDIR /Docker_SpringbootExample

VOLUME /tmp

# Prepare by downloading dependencies
ADD pom.xml /Docker_SpringbootExample/pom.xml
RUN ["mvn", "dependency:resolve"]

# Adding source, compile and package into a fat jar
ADD src /Docker_SpringbootExample/src

RUN ["mvn", "clean"]
RUN ["mvn", "package"]


COPY /target/demo-0.0.1-SNAPSHOT.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]
