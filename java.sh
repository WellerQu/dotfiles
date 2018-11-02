# JDK 1.8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export CLASS_PATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar

# Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.5.4
export M2=${M2_HOME}/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=${M2}:${PATH}

# Zookeeper
export ZK_HOME=/usr/local/apache-zookeeper/zookeeper-3.4.13
export ZK_CONF=${ZK_HOME}/conf
export ZK=${ZK_HOME}/bin
export PATH=${ZK}:${PATH}
