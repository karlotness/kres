doc := JQPResume.pdf
img := JQPResume.png
imgres := 75

all: $(doc) $(img)

%.pdf: %.tex
	pdflatex $<

$(img): $(doc)
	pdftocairo -png -r $(imgres) -singlefile $(doc)

clean:
	rm -f $(doc) *.log *.aux *.out

.PHONY: clean all
