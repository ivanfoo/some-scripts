##!/bin/sh
set -x
export SCRIPTS=/etc/backup
#########Cargamos funciones############
. $SCRIPTS/funciones.sh
. $SCRIPTS/variables.env

#####################

#Se Borran los backup segun la politica elegida
  #rm -rf `find $DBACKUP_POSTGRES -atime +60 -name "*.gz" -print` > /dev/null
  #rm -rf `find $FBACKUP_POSTGRES -atime +2 -name "*.gz" -print` > /dev/null

echo "Comienza el backup de postgres `date`" >> $FICHERO_ERROR
echo "Comienza el backup de postgres `date`" >> $FICHERO_LOG


if [ ! -s $BDMOODLE2 ] #Existe el fichero y no esta vacio
    then
       export ERROR_GENERAL=SI
       echo "No existe el directorio $BDMOODLE2"
else
    while read BD
        do
        /sbin/runuser -l $USUARIO_POSTGRES -c "$PGSQL_RUTA2/bin/pg_dump -i -h localhost -p 5432 -F p -v $BD | gzip -vc > $DIRECTORIO_BACKUP_POSTGRES/${BD}_`hostname`_`date "+%d.%m.%Y"`.gz"
    done < $BDMOODLE2
fi

