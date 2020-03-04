TEX := pdflatex

proposal.pdf:

.PHONY: clean
clean:
	$(GIT) clean -fX

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<
