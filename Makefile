LATEXMK := latexmk
MAIN := main
WATERMARK := watermark/watermark_logo.pdf
WATERMARK_TEX := watermark/watermark_logo.tex

.PHONY: all clean

all: $(WATERMARK)
	$(LATEXMK) $(MAIN).tex

$(WATERMARK): $(WATERMARK_TEX) logo.pdf
	$(LATEXMK) -cd $(WATERMARK_TEX)

clean:
	$(LATEXMK) -c $(MAIN).tex
	$(LATEXMK) -cd -c $(WATERMARK_TEX)
