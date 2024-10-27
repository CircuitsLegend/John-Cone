#include ../server_info.mk

platform=$(shell uname)
ifeq ($(platform),Darwin)
  LIBGS=--libgs=/usr/local/Cellar/ghostscript/9.26/lib/libgs.dylib
else
  LIBGS=
endif

SRC=$(filter-out abbrevs.tex makecube.tex tikz2pdf-template.tex,$(wildcard *.tex))

PNG=$(SRC:.tex=.png)
SVG=$(SRC:.tex=.svg)
DVI=$(SRC:.tex=.dvi)
PDF=$(SRC:.tex=.pdf)

all: dvi svg pdf png

pdf: $(PDF)
png: $(PNG)
dvi: $(DVI)
svg: $(SVG)


%.pdf: %.tex fig_preamble.latex
	@echo "making $@ from $<"
	@pdflatex  -interaction=batchmode -jobname=$* "\input{pdf_preamble.latex} \begin{document} \input{$<} \end{document}" > log 2>&1 

%.png: %.pdf
	@echo "making $@ from $<"
	convert -density 300 $< -quality 90 -sharpen 0x1 $*.png > log 2>&1

%.dvi: %.tex fig_preamble.latex
	@echo "making $@ from $<"
	@latex  -interaction=batchmode -jobname=$* "\input{fig_preamble.latex} \begin{document} \input{$<} \end{document}" 2>&1 log

%.svg: %.dvi
	@echo "making $@ from $<"
	@dvisvgm $(LIBGS) -n -TS2,2 $< 2>&1 log
#	dvisvgm --libgs=$(LIBGS) -n -TS2,2 $<



install:
	rsync --rsh=ssh --include-from=rsync-files ./* left:$(INSTALL_PATH)/$(PAGE_NAME)/figures/

clean:
	rm -f $(DVI)
	rm -f $(PNG)
	rm -f $(SVG)
	rm -f $(PDF)
	rm -f *.log
	rm -f *.aux
	rm -f *~

