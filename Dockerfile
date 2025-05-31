FROM arm64v8/openjdk:17-jdk-slim

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN apt-get update && apt-get install -y curl unzip \
    && mkdir -p "$CATALINA_HOME" \
    && curl -fsSL https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.105/bin/apache-tomcat-9.0.105.zip \
    | tar -xzC "$CATALINA_HOME" --strip-components=1 \
    && rm -rf $CATALINA_HOME/webapps/*

EXPOSE 8080

CMD ["catalina.sh", "run"]
