# JDK 1.8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
export CLASS_PATH=${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar

# Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.5.3
export M2=${M2_HOME}/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=${M2}:${PATH}
