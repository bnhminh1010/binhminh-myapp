FROM maven:3.9.11-eclipse-temurin-25 AS builder
WORKDIR /app
COPY . .
RUN env SOURCE_DATE_EPOCH=1774161855 mvn package -DskipTests
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
