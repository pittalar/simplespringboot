FROM openjdk:8
EXPOSE 8000
ADD target/simplespringboot.jar simplespringboot.jar
ENTRYPOINT ["java","-jar","/simplespringboot.jar"]