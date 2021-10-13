FROM openjdk:17 AS builder

COPY . .

RUN ["./gradlew", "assemble"]

FROM openjdk:17

COPY --from=builder /build/libs/demo-0.0.1-SNAPSHOT.jar .

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
