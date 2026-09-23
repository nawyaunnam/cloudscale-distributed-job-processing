FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /src
COPY pom.xml .
RUN mvn -q dependency:go-offline
COPY src src
RUN mvn -q -DskipTests package
FROM eclipse-temurin:21-jre-alpine
COPY --from=build /src/target/audit-service-0.1.0.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

