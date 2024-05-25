#FROM ubuntu:latest AS build
#RUN apt-get update
#RUN apt-get install openjdk-17-jdk -y
#COPY . .
#FROM maven:3.8.5-openjdk-17 AS build
#COPY . .
#RUN mvn clean package -DskipTests

FROM jelastic/maven:3.9.5-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-bullseye
COPY --from=build /target/FinanceTracker24.war app.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.war"]
