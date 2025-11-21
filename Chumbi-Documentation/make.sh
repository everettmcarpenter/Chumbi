FILE="build/chumbi-doc.aux"
if [ -f "$FILE" ]; then
    echo "let's do this"
fi 
bibtex build/chumbi-doc.aux
pdflatex -output-format=pdf -output-directory=build/ chumbi-doc
bibtex build/chumbi-doc.aux
pdflatex -output-format=pdf -output-directory=build/ chumbi-doc
zip -r -b . chumbi-doc.zip .