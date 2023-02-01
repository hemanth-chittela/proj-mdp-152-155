# Base images taken from centos
FROM centos:7 as build

# install Java-11
RUN yum -y install java-11-openjdk-devel

# creating a directory
RUN mkdir /calc

# navigating to the directory
WORKDIR /calc

# Copy the code from here to /calc
COPY . /calc

# Build App
RUN yum -y install maven
RUN mvn package

# Install tomcat
FROM tomcat

# Copy into webapps
COPY --from=build /calc/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps

