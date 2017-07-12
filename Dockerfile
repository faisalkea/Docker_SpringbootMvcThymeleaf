FROM maven:latest

#Author of the Docker File
MAINTAINER Faisal Jarkass

VOLUME /tmp
RUN ["mvn", "clean"]
RUN ["mvn", "package"]
COPY /target/demo-0.0.1-SNAPSHOT.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]
