#FROM openjdk:19-jdk-alpine
FROM eclipse-temurin:19-jdk-alpine

RUN echo '\
public class HelloWorld {\
    public static void main(String[] args) {\
        System.out.println("Hello, World!");\
    }\
}'\
>> HelloWorld.java

RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]