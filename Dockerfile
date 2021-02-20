# Start with a base image containing Java runtime
FROM openjdk:11-jre-slim

# Add Author info
LABEL maintainer="f.softwareengineer@gmail.com"

# Add a volume to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
#gradle build를 하면 .jar파일이 생성된다. 내 환경에서는 build/libs/아래에 생성되었다.
#프로젝트의 환경에 따라 tartget아래에 생성되기도 하도 build아래에 생성되기도 한다.
#프로젝트를 빌드 후 .jar파일을 찾아 그 경로를 확인하는게 중요하다.
#상대경로를 적어주어야 한다는 것이다. 안그러면 다른 팀원의 개발환경에서는 실행되지 않을 수 있다
ARG JAR_FILE=build/libs/demo-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} to-do-springboot.jar

# Run the jar file
# java -Djava.security.edg=file:/dev/./urandom -jar /to-do-springboot.jar 와 같다.
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/to-do-springboot.jar"]
