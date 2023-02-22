# Base images taken from centos
FROM maven:3.6.3-jdk-8-slim AS build

# creating a directory
RUN mkdir /calc

# navigating to the directory
WORKDIR /calc

# Copy the code from here to /calc
COPY . /calc

# Build App
RUN mvn package

# Install tomcat
FROM tomcat

# Copy into webapps
COPY --from=build /calc/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps
