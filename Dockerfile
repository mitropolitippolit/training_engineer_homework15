FROM alpine:latest
EXPOSE 8081 8080
ENV CATALINA_HOME=/opt/tomcat
ENV GIT_REPO_URL=https://github.com/boxfuse/boxfuse-sample-java-war-hello
ENV JMX_AGENT_DNL_URL=https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.17.0/jmx_prometheus_javaagent-0.17.0.jar
ENV JMX_AGENT_FILE_NAME=jmx_agent.jar
ENV JMX_AGENT_PORT=8081
ENV TOMCAT_VERSION=9.0.64
ENV TOMCAT_DNL_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
ENV TOMCAT_YML_DNL_URL=https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml
ENV WAR_FILE_NAME=hello-1.0.war
RUN apk add --update git maven openjdk8 wget
WORKDIR /opt
RUN wget ${TOMCAT_DNL_URL} &&\
    tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz &&\
    mv apache-tomcat-${TOMCAT_VERSION} tomcat &&\
    rm -rf apache-tomcat-${TOMCAT_VERSION}.tar.gz &&\
    rm -rf tomcat/webapps/*
WORKDIR /opt/exporter
RUN wget -O ${JMX_AGENT_FILE_NAME} ${JMX_AGENT_DNL_URL} 
RUN wget ${TOMCAT_YML_DNL_URL}
WORKDIR /work
RUN git clone ${GIT_REPO_URL} app
WORKDIR /work/app
RUN mvn package &&\
    mv target/${WAR_FILE_NAME} ${CATALINA_HOME}/webapps/ROOT.war
ENV CATALINA_OPTS="${CATALINA_OPTS} -javaagent:/opt/exporter/jmx_agent.jar=${JMX_AGENT_PORT}:/opt/exporter/tomcat.yml"
CMD /opt/tomcat/bin/catalina.sh run
