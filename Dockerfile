FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /todolist
ADD pom.xml .
ADD . /todolist
RUN mvn clean package
FROM openjdk:8-oraclelinux7
WORKDIR .
COPY --from=maven_builder /todolist/target/todolist-1.0.jar .
CMD ["java", "-cp", "./todolist-1.0-jar-with-dependencies.jar", "com.javacodegeeks.todolist.TodoServer"]
