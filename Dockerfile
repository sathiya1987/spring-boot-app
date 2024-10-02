FROM openjdk:17-jdk-slim

WORKDIR /app

COPY /home/runner/.m2/repository/com/rest-api/api-springboot/0.0.1-SNAPSHOT/api-springboot-0.0.1-SNAPSHOT.jar /app/my-spring-boot-app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "my-spring-boot-app.jar"]
