# -*- coding: utf-8 -*-
"""
Created on Tue May 10 11:30:01 2022

@author: Matthias
"""

from pathlib import Path
import shutil

dirToClean = Path('C:/Users/Matthias/Documents/Formations/ExploitSysteme/Stage202205/Python/tomcat')

archive1 = dirToClean / "10"

if archive1.is_dir():
    # archive1.rmdir()
    print("about to remove recursively directory:", archive1)
    shutil.rmtree(archive1)
    
f = dirToClean / "test.txt.txt"

if f.is_file():
    print("about to remove file:", f)
    f.unlink()
    
for fToClean in dirToClean.iterdir():
    if fToClean.is_dir():
        shutil.rmtree(fToClean)
    elif fToClean.is_file() or fToClean.is_symlink():
        fToClean.unlink()
        
    
    
    
    
    
    
    