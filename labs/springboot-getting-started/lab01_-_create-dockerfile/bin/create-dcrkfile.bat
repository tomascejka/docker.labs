@echo off
REM
REM Vytvori to Dockerfile pro spring-boot aplikaci
REM
REM @author tomas.cejka
REM

SET LAB_PATH=%cd%
SET JDK_VERSION=17
REM Nazev artefaktu, kt. predstavuje samotnout aplikaci, jar soubor
SET JAR_NAME=application
REM Adresar, kde se bude aplikace nalezat v docker kontejneru (linux-based OS), tzn. /%APP_DIR%
SET APP_DIR=application
REM adresar, kde vznikne artefakt (jar/ear/war), kt. je mozne nakopirovat do docker image
REM u maven-based projektu je to /target, u gradle-based je to zase /build
SET BUILD_DIR=target
REM -- Vydavatele jdk knihovny, napr. openjdk, eclipse-temurin
REM -- https://hub.docker.com/_/eclipse-temurin?tab=tags&page=1&name=alpine
REM -- https://hub.docker.com/_/openjdk?tab=tags&page=1&name=alpine
SET JDK_PROVIDER=eclipse-temurin

REM vytvori to soubor Dockerfile na ceste v projektu
(
echo #
echo # Dockerfile for spring-boot application
echo #
echo # @see https://spring.io/guides/gs/spring-boot-docker/, pridal jsem instrukci uzivatele spring
echo # @see https://blog.jetbrains.com/idea/2021/04/summary-spring-boot-loves-k8s/
echo # @see https://www.cyberciti.biz/faq/how-to-add-and-delete-users-on-alpine-linux/
echo # 
echo FROM %JDK_PROVIDER%:%JDK_VERSION%-jdk-alpine AS builder
echo WORKDIR source
echo # -- Prozatim zakomentovano, aby sla zbuildovat docker image - bez aplikace
echo #ARG JAR_FILE=%BUILD_DIR%/%JAR_NAME%.jar
echo #COPY ${JAR_FILE} %JAR_NAME%.jar
echo #RUN java -Djarmode=layertools -jar %JAR_NAME%.jar extract
echo.
echo FROM %JDK_PROVIDER%:%JDK_VERSION%-jre-alpine
echo RUN addgroup -S spring ^&^& adduser -H -S spring -G spring -s /bin/bash spring
echo USER spring:spring
echo WORKDIR %APP_DIR%
echo #COPY --from=builder source/dependencies/ ./
echo #COPY --from=builder source/spring-boot-loader/ ./
echo #COPY --from=builder source/snapshot-dependencies/ ./
echo #COPY --from=builder source/%APP_DIR%/ ./
echo ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
) > ..\Dockerfile
