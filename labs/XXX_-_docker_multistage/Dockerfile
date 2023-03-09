#
# @see (Guides/Get Started           ) https://docs.docker.com/get-started/09_image_best/#multi-stage-builds
# @see (Guides/Develop with Docker   ) https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#use-multi-stage-builds
# @see (Guides/Language Specific/Java) https://docs.docker.com/language/java/develop/#multi-stage-dockerfile-for-development
#
FROM eclipse-temurin:19-jdk-alpine AS build

RUN apk add --no-cache --upgrade bash

WORKDIR /app
# @see https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/docker-install.html
RUN echo $' \
public class App { \
	public static void main(String[] args) { \
		System.out.println("Welcome to multistage dockerfile"); \
	} \
}' > App.java
RUN javac App.java

FROM eclipse-temurin:19-jre-alpine
COPY --from=build /app/App.class ./App.class
CMD ["java", "App"]