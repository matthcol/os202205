#!/usr/bin/bash
# usage : deploy.sh archive destination

#if [ $# -ne 2 ]
if (($# != 2))
then
	echo "Erreur: il faut 2 arguments"
	exit 1       
fi

if [ ! -f "$1" ]
then
	echo "Erreur: $1 n'existe pas"
	exit 2
fi

if [ ! -d "$2" ]
then
	echo "Creation repertoire inexistant : $2"
#	mkdir -p "$2"
#	STATUS_MKDIR=$?
#	if [ ${STATUS_MKDIR} -ne 0 ]
#	then
#		echo "Impossible de creer le répertoire $2"
#		exit 3
#	fi
	mkdir -p "$2" || echo "Impossible de creer le répertoire $2" && exit 3
fi


CURRDIR=${PWD}

if [ "${1:0:1}" = "/" ]
then
	ARCHIVE=$1
else
	ARCHIVE=${CURRDIR}/$1
fi

echo "deploy ${ARCHIVE} dans $2"

cd "$2"

# extraire l'archive en fonction de l'extension
case ${ARCHIVE} in
	*.tar | *.tar.gz | *.tgz | *.tar.bz2)
		tar xf "${ARCHIVE}"
		;;
	*.zip)
		unzip "${ARCHIVE}"
		;;
	*.7z)
		#p7zip -k -d "${ARCHIVE}"
		7z x ${ARCHIVE}
		;;
	*.rar)
		unrar "${ARCHIVE}"
		;;
	*)
		echo "Format d'archive inconnu"
		exit 4
		;;
esac

# all is good
exit 0













