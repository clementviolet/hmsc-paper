#!/bin/bash
# echo "Test"

# Main

cd src

pandoc-citeproc --bib2json bibliography.bib > references.json
# python3 .assets/scripts/bibliography.py
python3 references.py

# Convert the abstract for the pdf
pandoc -f markdown -t latex chapters/00-abstract.md -o abstract.tex

# Convert the main text for the pdf
pandoc -f markdown -t markdown chapters/01-introduction.md chapters/02-methods.md \
  chapters/03-results.md chapters/04-discussion.md \
  chapters/05-formal.md -o main.md

echo "Microsof Word Document"

pandoc -f markdown -t docx chapters/00-abstract.md main.md \
  -o preprint.docx --metadata-file=../metadata.json \
  --filter pandoc-fignos --filter pandoc-tablenos \
  --citeproc --bibliography=references.json \
  --csl=template/ecology-letters.cls

echo "PDF Document" 
# There is a small issue with pandoc-tablenos (multiply defined labels) but I can't figure what is happening. It seems fine on the pdf output thus.

cp template/template.tex template.tex
cp template/lapreprint.cls lapreprint.cls

pandoc -f markdown -t latex main.md -o preprint.tex --template=template.tex \
  --filter pandoc-xnos --metadata-file=../metadata.json \
  --citeproc --bibliography=references.json \
  --csl=template/ecology-letters.cls

latexmk preprint.tex  -f -lualatex --file-line-error --interaction=nonstopmode && latexmk -c

echo "Annexes"

pandoc -f markdown -t docx supplementary/Suppinfo.md -o Suppinfo.docx --filter pandoc-xnos \
  --metadata fignos-caption-name="Figure S" \
  --metadata tablenos-caption-name="Table S" \
  --citeproc --bibliography=references.json --csl=template/ecology-letters.cls

# Clean-up
rm preprint.suppinfo
rm preprint.fff

mv preprint* ../rendered/

mv Suppinfo.docx ../rendered/

rm abstract.tex main.md template.tex references.json lapreprint.cls 

cd ..