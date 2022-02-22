BIB := bibtex
CROP := pdfcrop
DOT := dot
GIT := git
TEX := pdflatex

OVERRIDE_DOT := false

thesis.pdf: figs/calltree_function-crop.pdf
thesis.pdf: figs/calltree_function_hook-crop.pdf
thesis.pdf: figs/calltree_function_launch-crop.pdf
thesis.pdf: figs/calltree_function_switch-crop.pdf
thesis.pdf: figs/jstables-crop.pdf
thesis.pdf: figs/gotables-crop.pdf
thesis.pdf: figs/pltables-crop.pdf
thesis.pdf: figs/procimg_perobj.pdf
thesis.pdf: figs/procimg_perthd.pdf
thesis.pdf: figs/reinit-crop.pdf
thesis.pdf: figs/reinit_tls-crop.pdf
thesis.pdf: figs/tables-crop.pdf
thesis.pdf: functions/figs/architecture.pdf
thesis.pdf: functions/figs/progsupport.pdf
thesis.pdf: microservices/figs/fancy_system-crop.pdf
thesis.pdf: acknowledgements.tex
thesis.pdf: concl.tex
thesis.pdf: functions.tex
thesis.pdf: gotcha.tex
thesis.pdf: inger.tex
thesis.pdf: ingerc.tex
thesis.pdf: intro.tex
thesis.pdf: microservices.tex
thesis.pdf: safety.tex
thesis.pdf: statement.tex
thesis.pdf: strobelight.tex
thesis.pdf: turquoise.tex

figs/jstables.pdf: private OVERRIDE_DOT := true

.PHONY: clean
clean:
	$(GIT) clean -fX
	$(GIT) submodule foreach --recursive $(GIT) clean -fX

%.pdf: %.dot
	$(DOT) -Tpdf $(DOTFLAGS) -o $@ $< || $(OVERRIDE_DOT)

%.pdf: %.tex
	$(TEX) $(TEXFLAGS) $<
	$(BIB) $*.aux
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

%-crop.pdf: %.pdf
	$(CROP) $<
