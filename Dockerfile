
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn -B clean package -DskipTests
RUN JAR=$(find target -maxdepth 1 -name '*.jar' ! -name '*.original' | head -n 1) && cp "$JAR" app.jar

FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/app.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]