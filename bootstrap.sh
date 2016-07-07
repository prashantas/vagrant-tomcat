#!/usr/bin/env bash

#sed -i '$aCATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=localhost"' \/root\/.bash_profile

#sed -i '$aexport CATALINA_OPTS'  \/root\/.bash_profile
#sed -i '$aexport PATH="$CATALINA_HOME:$PATH"' \/root\/.bash_profile

source ~/.bash_profile
echo 'export CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=localhost"' >> ~/.bash_profile

echo 'export PATH="$CATALINA_OPTS:$PATH"'>> ~/.bash_profile  
#sed -i '$aJAVA_HOME="/usr/java"'

source ~/.bash_profile


JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
source ~/.bash_profile
echo "JAVA VERSION installed :: $JAVA_VERSION"

#sed -i '$aexport JAVA_HOME="/usr/java/'"$JAVA_VERSION"'/"'  \/root\/.bash_profile
#sed -i '$aexport PATH="$JAVA_HOME:$PATH"' \/root\/.bash_profile

echo "JAVA_HOME='"/usr/java/$JAVA_VERSION"'">> ~/.bash_profile
echo 'export PATH="$JAVA_HOME:$PATH"'>> ~/.bash_profile  
sleep 2

source ~/.bash_profile
source ~/.bash_profile

echo "JAVA_HOME=$JAVA_HOME"


echo "CATALINA_OPTS=$CATALINA_OPTS"

echo "Now Installing tomcat..."

tomcat_tar="apache-tomcat-7.0.69.tar.gz"

tar -xzvf /vagrant/apache-tomcat-7.0.69.tar.gz -C /vagrant/ >/dev/null

sleep 10

/vagrant/apache-tomcat-7.0.69/bin/startup.sh

sleep 10
