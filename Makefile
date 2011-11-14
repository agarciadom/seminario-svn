PDF=transparencias.pdf
LATEXMK_FLAGS=-r latexmkrc.pl -pdf
FIGURES=cc-by-sa.pdf compare-repos-ohloh.pdf
.PHONY: all install review clean

all: $(PDF)

$(PDF): $(FIGURES)

install:
	sudo apt-get install latexmk inkscape
	wget -c http://www.andre-simon.de/zip/ansifilter-1.5.tar.bz2
	tar xf ansifilter-1.5.tar.bz2
	cd ansifilter-1.5 && make && sudo make install

%.pdf: %.tex
	latexmk $(LATEXMK_FLAGS) $<

%.pdf: %.svg
	inkscape -A $@ $<

review: $(PDF)
	xdg-open $<
	latexmk $(LATEXMK_FLAGS) -pvc ${<:.pdf=.tex}

clean:
	latexmk -C -pdf $<
	$(RM) $(FIGURES) $(PDF) *.synctex.gz cmd.tex
