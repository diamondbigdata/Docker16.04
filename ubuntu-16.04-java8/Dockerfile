FROM localreg:5000/diamondbase:16.04
MAINTAINER "zhangjun <ibmzhangjun@icloud.com>"

ENV HOME /

ADD jdk.tar /usr/lib/jvm
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/bin/java 3000
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 3000

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASS_PATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

CMD ["/sbin/my_init"]
