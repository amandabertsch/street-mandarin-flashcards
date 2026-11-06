#!/bin/zsh
# Rebuild index.html from app.html + data.json, bump the offline cache version.
cd "${0:A:h}"
python3 -I - <<'PY'
import time
d=open('data.json',encoding='utf-8').read()
open('index.html','w',encoding='utf-8').write(open('app.html',encoding='utf-8').read().replace('/*DATA*/null',d))
s=open('sw.js').read()
import re; s=re.sub(r'sm-flashcards-[^"]*','sm-flashcards-'+time.strftime('%Y%m%d%H%M%S'),s)
open('sw.js','w').write(s)
PY
