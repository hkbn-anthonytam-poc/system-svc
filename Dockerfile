FROM ubuntu:latest

WORKDIR /app

USER root
RUN apt-get update -y && apt-get install -y curl openjdk-17-jdk-headless && apt-get clean all
RUN groupadd api-user
RUN useradd -u 1001 -g api-user api-user

USER api-user

ADD /target/*.jar api.jar

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar api.jar"]