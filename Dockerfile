# 版本信息
FROM centos
MAINTAINER xiazhiqiang "xiazhiqiang@gagogroup.com"

# OS环境配置
RUN yum install -y wget

WORKDIR /var/tmp

# 安装JDK
RUN mkdir ./jdk
ADD ./jdk-8u251-linux-x64.tar.gz ./jdk

# 安装tomcat
RUN mkdir ./tomcat
ADD ./apache-tomcat-8.5.54.tar.gz ./tomcat/
RUN rm -rf ./tomcat/apache-tomcat-8.5.54/bin/catalina.sh
ADD ./catalina.sh ./tomcat/apache-tomcat-8.5.54/bin/catalina.sh

#设置环境变量
ENV JAVA_HOME /var/tmp/jdk/jdk1.8.0_251
ENV CATALINA_HOME /var/tmp/tomcat/apache-tomcat-8.5.54
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin