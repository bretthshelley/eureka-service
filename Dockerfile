FROM adoptopenjdk/openjdk16:latest

WORKDIR /java-apps/

# enables the use of netstat and curl commands to determine use of ports
RUN apt-get update && apt-get install -y net-tools

COPY ./build/libs/eureka-service-1.0.jar /java-apps/eureka-service-1.0.jar

# the *:8003 part of the following line is critical for docker debugging 
ENV JAVA_TOOL_OPTIONS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8003

# run the java apps at container startup
CMD ["java", "-jar", "eureka-service-1.0.jar"]

EXPOSE 8761
EXPOSE 8003


