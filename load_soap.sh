#! /bin/bash

user=$1
passw=$2

if [ -z $user ]; then
    echo "Usage: load_soap USER [PASSW]"
    exit 1
fi

if [ -z $passw ]; then
    passw=$user
fi

tmp_dir='/tmp/load_soap'
file='oc4j_extended_101350.zip'
remote_file="ftp://ftp.ocu.es/OracleDB/$file"

mkdir $tmp_dir
echo "Downloading $remote_file..."
curl $remote_file -o $tmp_dir && echo "Done"
unzip $tmp_dir/$file -d $tmp_dir/${file%%.*}
OC4J_HOME=$tmp_dir/${file%%.*}

loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/j2ee/home/lib/ejb.jar
loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/j2ee/home/lib/activation.jar
loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/j2ee/home/lib/mail.jar
loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/j2ee/home/lib/servlet.jar
loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/lib/dms.jar
loadjava -f -v -r -genmissing -u ${user}/${passw} $OC4J_HOME/webservices/lib/soap.jar

rm -rf $tmp_dir

exit 0
