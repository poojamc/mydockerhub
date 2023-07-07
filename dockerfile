FROM ubuntu:16.04 AS builder
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
WORKDIR /app
COPY . .
RUN mvn clean package

FROM alpine:latest
COPY --from=builder /app/target/hello-world-war-2.0.3.war  /opt
