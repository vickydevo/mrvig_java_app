FROM openjdk:21-slim-buster
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java", "-jar", "app.jar"]