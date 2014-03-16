PDF=transparencias.pdf
LATEXMK_FLAGS=-r latexmkrc.pl -pdf
FIGURES=cc-by-sa.pdf compare-repos-ohloh.pdf
.PHONY: all install ansifilter review clean

all: $(PDF)

$(PDF): $(FIGURES)

install: ansifilter
	sudo apt-get install latexmk inkscape

ansifilter:
	wget -c http://www.andre-simon.de/zip/ansifilter-1.7.tar.bz2
	tar xf ansifilter-1.7.tar.bz2
	cd ansifilter && make && sudo make install

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
