# -*- coding: utf-8 -*-
"""
Script de deploiement d'une archive au format:
    - tar, tar.gz, tgz, tar.bz2
    - zip
    - 7z

Created on Tue May 10 09:18:16 2022

@author: Matthias
"""

from pathlib import Path
import shutil
import sys
import re

print(sys.argv)

if len(sys.argv) != 3:
    print("Erreur: Le script attend 2 arguments", file=sys.stderr)
    exit(1)
    
archive = Path(sys.argv[1])
destination = Path(sys.argv[2])

print("deploy", archive, "vers", destination)

if not archive.is_file():
    print("Erreur: Le 1er argument n'est pas un fichier régulier ou n'existe pas", 
          file=sys.stderr)
    exit(2)

if not destination.exists():
    print("Creation du repertoire de destination:", destination)
    destination.mkdir(parents=True, exist_ok=True)
elif not destination.is_dir():
    print("Erreur: Le 2e argument existe mais n'est pas un répertoire",
          file=sys.stderr)
    exit(3)
    
if not re.search(r"\.(tar|tgz|tar\.gz|tar\.bz2|zip)$", archive.name):
    print("Format d'archive inconnue", file=sys.stderr)
    exit(4)
    
shutil.unpack_archive(archive, destination)
















