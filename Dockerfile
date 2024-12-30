# Use OpenJDK 17 slim image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the target folder into the container
COPY target/dockerapp-0.0.1-SNAPSHOT.jar dockerapp.jar

# Expose port 8088 (default Spring Boot port)
EXPOSE 8088

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "dockerapp.jar"]

