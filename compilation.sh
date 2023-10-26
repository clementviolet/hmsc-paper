cd src

# Conversion Word
echo "# Abstract" > abstract_tmp.md
echo "" >> abstract_tmp.md
cat chapters/00-abstract.md >> abstract_tmp.md

pandoc -f markdown -t markdown \
abstract_tmp.md \
chapters/01-introduction.md \
chapters/02-methods_a.md \
-o main_tmp.md \
--verbose \
--template=template/table_template.tex

cat main_tmp.md \
chapters/03-results.md \
chapters/04-discussion.md \
chapters/05-formal.md \
> chapters/main_docx.md

rm main_tmp.md abstract_tmp.md

pandoc -f markdown -t docx \
chapters/main_docx.md -o \
../rendered/preprint.docx \
--verbose \
--metadata-file=../metadata.json \
--reference-doc=template/template.docx \
--filter pandoc-crossref \
--metadata crossrefYaml="template/pandoc_crossref_conf.yml" \
--metadata link-bibliography="true" \
--metadata link-citations="true" \
--citeproc --biblatex \
--bibliography=bibliography.bib \
--csl=template/ecology-letters.cls

pandoc -f markdown -t docx \
chapters/main_docx.md -o \
../rendered/preprint.docx \
--verbose \
--metadata-file=../metadata.json \
--reference-doc=template/template.docx \
--filter pandoc-crossref \
--metadata crossrefYaml="template/pandoc_crossref_conf.yml" \
--metadata link-bibliography="true" \
--metadata link-citations="true" \
--citeproc --biblatex \
--bibliography=bibliography.bib \
--csl=template/ecology-letters.cls

pandoc -f markdown -t docx \
supplementary/Suppinfo.md -o \
../rendered/Suppinfo.docx \
--verbose \
--reference-doc=template/template.docx \
--filter pandoc-crossref \
--metadata crossrefYaml="template/pandoc_crossref_conf.yml" \
--metadata link-bibliography="true" \
--metadata link-citations="true" \
--citeproc --biblatex \
--bibliography=bibliography.bib \
--csl=template/ecology-letters.cls

cp ../rendered/preprint.docx ../rendered/Standalone.docx

## Cleanup
rm chapters/main_docx.md


# Conversion TeX

pandoc -f markdown -t latex chapters/00-abstract.md -o abstract.tex

## Convert the main text up to the table
pandoc -f markdown -t markdown \
chapters/01-introduction.md \
chapters/02-methods_a.md \
-o main_tmp.md \
--verbose \
--template=template/table_template.md \
--metadata latex

## Add the rest of the text and concatenates it
cat main_tmp.md \
chapters/03-results.md \
chapters/04-discussion.md \
chapters/05-formal.md \
> main_tex.md

## Create the pdf

cp template/template.tex .
cp template/lapreprint.cls .

latexmk -c
pandoc -f markdown -t latex main_tex.md -o preprint.tex \
--verbose \
--template=template.tex \
--metadata-file=../metadata.json \
--filter pandoc-crossref \
--metadata link-citations="true" \
--metadata crossrefYaml=pandoc_crossref_conf.yml \
--citeproc --biblatex --bibliography=bibliography.bib

latexmk preprint.tex  -f -lualatex --file-line-error --interaction=nonstopmode && latexmk -c

mv preprint.pdf ../rendered/
mv preprint.tex ../rendered/

## Cleaning -up
rm main_tmp.md main_tex.md template.tex lapreprint.cls \
preprint.bbl preprint.suppinfo preprint.run.xml