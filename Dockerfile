FROM openjdk:11 AS builder

COPY . .

RUN ["./gradlew", "assemble"]

FROM openjdk:11

COPY --from=builder /build/libs/demo-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
