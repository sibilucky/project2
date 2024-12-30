# Use official Maven image to build the project
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the src folder to the working directory
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use a smaller base image to run the application
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file from the previous stage to the current container
COPY --from=builder /app/target/dockerapp-0.0.1-SNAPSHOT.jar dockerapp.jar

# Expose port 8080 (default Spring Boot port)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "dockerapp.jar"]
