TEX=pdflatex
BIBTEX=bibtex
TARGET=resume
EXTENSIONS=aux toc idx ind ilg log lof lot lol bbl blg

RESUME=resume

all: ${RESUME}

${RESUME}: ${RESUME}.tex biblio-confs-journals.bib
	${TEX} ${RESUME}
	${BIBTEX} ${RESUME}1
	${TEX} ${RESUME}
	${TEX} ${RESUME}

clean:
	for EXT in ${EXTENSIONS}; \
	do \
	find `pwd` -name \*\.$${EXT} -exec rm -v \{\} \; ;\
	done
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.pdf
	rm -f ${TARGET}.ps
	rm -f ${TARGET}.out
	rm -f www/*\.*
	rm -f *~

