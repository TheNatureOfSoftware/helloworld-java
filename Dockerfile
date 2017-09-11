FROM openjdk:8-jdk-alpine as builder

ADD . /usr/src/helloworld/

WORKDIR /usr/src/helloworld

RUN ls -la

RUN ./mvnw package

FROM openjdk:8-jre-alpine

COPY --from=builder /usr/src/helloworld/target/helloworld-0.0.1-SNAPSHOT.jar /app/helloworld-0.0.1-SNAPSHOT.jar

WORKDIR /app

CMD ["java", "-jar", "helloworld-0.0.1-SNAPSHOT.jar"]