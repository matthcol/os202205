#!/usr/bin/bash
# usage : deploy.sh archive destination
echo "Nom du programme: $0"
echo 'Texte non interprété: $0'
echo "Variable qui n'existe pas: $TOTO"
echo "Arguments:"
echo "- 1: $1"
echo "- 2: $2"
echo "- 3: $3"
echo "- 4: $4"
echo "All args (*): $*"
echo "All args (@): $@"
echo "Nb args: $#"

#if [ $# -ne 2 ]
if (($# != 2))
then
	echo "Erreur: il faut 2 arguments"
	exit 1       
fi

if [ ! -e "$1" ]
then
	echo "Erreur: $1 n'existe pas"
	exit 2
fi

if [ ! -d "$2" ]
then
	echo "Erreur: $2 n'existe pas ou n'est pas un répertoire"
	exit 2
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
tar xf "${ARCHIVE}"
# cd "${CURRDIR}"
exit 0













