BIB := bibtex
CROP := pdfcrop
DOT := dot
GIT := git
TEX := pdflatex

thesis.pdf: functions/figs/architecture.pdf
thesis.pdf: functions/figs/progsupport.pdf
thesis.pdf: microservices/figs/fancy_system-crop.pdf

.PHONY: clean
clean:
	$(GIT) clean -fX
	$(GIT) submodule foreach --recursive $(GIT) clean -fX

%.pdf: %.dot
	$(DOT) -Tpdf $(DOTFLAGS) -o $@ $<

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(BIB) $*.aux
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

%-crop.pdf: %.pdf
	$(CROP) $<
