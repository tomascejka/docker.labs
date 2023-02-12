#
# Dockerfile for spring-boot application
#
# @see https://spring.io/guides/gs/spring-boot-docker/, pridal jsem instrukci uzivatele spring
# @see https://blog.jetbrains.com/idea/2021/04/summary-spring-boot-loves-k8s/
# 
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR source
# -- Prozatim zakomentovano, aby sla zbuildovat docker image - bez aplikace
#ARG JAR_FILE=target/application.jar
#COPY ${JAR_FILE} application.jar
#RUN java -Djarmode=layertools -jar application.jar extract

FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S spring && adduser -H -S spring -G spring -s /bin/bash spring
USER spring:spring
WORKDIR application
#COPY --from=builder source/dependencies/ ./
#COPY --from=builder source/spring-boot-loader/ ./
#COPY --from=builder source/snapshot-dependencies/ ./
#COPY --from=builder source/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
