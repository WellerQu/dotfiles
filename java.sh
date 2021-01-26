# JDK 1.8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JDK_HOME=${JAVA_HOME}
export CLASS_PATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
export PATH=${JAVA_HOME}/bin:${PATH}

# Maven
#export M2_HOME=/usr/local/apache-maven/apache-maven-3.5.4
#export M2=${M2_HOME}/bin
#export MAVEN_OPTS="-Xms256m -Xmx512m"
#export PATH=${M2}:${PATH}

# Zookeeper
#export ZK_HOME=/usr/local/apache-zookeeper/zookeeper-3.4.13
#export ZK_CONF=${ZK_HOME}/conf
#export ZK=${ZK_HOME}/bin
#export PATH=${ZK}:${PATH}
