#! /bin/bash

schema=$1
passw=$2

if [ -z $schema ]; then
    echo "Usage: load_soap SCHEMA"
    exit 1
fi

if [ -z $passw ]; then
    passw=$schema
fi

OC4J_HOME=/tmp/oc4j_extended_101350

loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/j2ee/home/lib/ejb.jar
loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/j2ee/home/lib/activation.jar
loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/j2ee/home/lib/mail.jar
loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/j2ee/home/lib/servlet.jar
loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/lib/dms.jar
loadjava -f -v -r -genmissing -u ${schema}/${passw} $OC4J_HOME/webservices/lib/soap.jar

exit 0
