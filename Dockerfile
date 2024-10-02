# Step 1: Build the Spring Boot application
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean install -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/api-springboot-0.0.1-SNAPSHOT.jar  /app/my-spring-boot-app.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/my-spring-boot-app.jar]
