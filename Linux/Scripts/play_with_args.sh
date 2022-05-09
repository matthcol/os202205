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

exit 0