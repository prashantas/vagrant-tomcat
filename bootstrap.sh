#!/usr/bin/env bash

sed -i '$aCATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=localhost"' \/root\/.bash_profile

sed -i '$aexport CATALINA_OPTS'  \/root\/.bash_profile

source ~/.bash_profile
