CROP := pdfcrop
DOT := dot
GIT := git
TEX := pdflatex

proposal.pdf:

.PHONY: clean
clean:
	$(GIT) clean -fX

%.pdf: %.dot
	$(DOT) -Tpdf $(DOTFLAGS) -o $@ $<

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

%-crop.pdf: %.pdf
	$(CROP) $<
