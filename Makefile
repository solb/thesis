TARGET := paper
EXTRAS := figs/progsupport.pdf figs/architecture.pdf

all: pdf

pdf: $(EXTRAS)
	GS_OPTIONS=-dPDFSETTINGS=/prepress rubber -e "bibtex.crossrefs 100" --pdf -Wrefs -Wmisc paper

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *~ *.bak $(TARGET).ps $(TARGET).pdf $(EXTRAS)

ps: pdf
	GS_OPTIONS=-dPDFSETTINGS=/prepress pdftops -level1 $(TARGET).pdf

%.pdf: %.dot
	dot -Tpdf -o $@ $<
