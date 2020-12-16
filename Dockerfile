FROM registry.cn-hangzhou.aliyuncs.com/acs/maven
ENV MY_HOME=/usr/src/app
RUN mkdir -p $MY_HOME
WORKDIR $MY_HOME
ADD pom.xml $MY_HOME
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","verify","clean","--fail-never"]
ADD . $MY_HOME
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","install"]
ENTRYPOINT ["java","-jar","/usr/src/app/target/my-blog-1.0.1-SNAPSHOT.jar"]
EXPOSE 9999