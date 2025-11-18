FROM gradle:8-jdk17 as builder
USER root
WORKDIR /builder
ADD . /builder
RUN gradle build --stacktrace

FROM openjdk:17-jdk-slim
WORKDIR /app
EXPOSE 8080
COPY --from=builder /builder/build/libs/demo-0.0.1.jar .
CMD ["java", "-jar", "demo-0.0.1.jar"]