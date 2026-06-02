LATEXMK := latexmk
MAIN := main
WATERMARK := watermark/watermark_logo.pdf
WATERMARK_TEX := watermark/watermark_logo.tex
WATERMARK_LATEXMK := $(LATEXMK) -cd -pdf -pdflatex='pdflatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S'

.PHONY: all clean cleanall

all: $(WATERMARK)
	$(LATEXMK) $(MAIN).tex

$(WATERMARK): $(WATERMARK_TEX) logo.pdf
	$(WATERMARK_LATEXMK) $(WATERMARK_TEX)

clean:
	$(LATEXMK) -c $(MAIN).tex
	$(LATEXMK) -cd -c $(WATERMARK_TEX)

cleanall: clean
	rm -f $(MAIN).pdf $(WATERMARK)
