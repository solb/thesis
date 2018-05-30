TARGET=paper
DEPEND=figs/fancy_system-crop.pdf

.PHONY: all
all: pdf

.PHONY: pdf
pdf: $(DEPEND)
	GS_OPTIONS=-dPDFSETTINGS=/prepress rubber -e "bibtex.crossrefs 100" --pdf -Wrefs -Wmisc paper

.PHONY: clean
clean:
	rm -f *.aux *.log *.out *.bbl *.blg *~ *.bak $(TARGET).ps $(TARGET).pdf

.PHONY: ps
ps: pdf
	GS_OPTIONS=-dPDFSETTINGS=/prepress pdftops -level1 $(TARGET).pdf

%.pdf: %.dot
	dot -Tpdf -o $@ $<

%-crop.pdf: %.pdf
	pdfcrop $<
