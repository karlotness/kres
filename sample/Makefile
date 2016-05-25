doc := JQPResume.pdf
img := JQPResume.png
imgres := 75
thumb := JQPResume-thumb.png
thumbres := 30

all: $(doc) $(img) $(thumb)

%.pdf: %.tex
	pdflatex $<

$(img): $(doc)
	pdftocairo -png -r $(imgres) -singlefile $(doc) $(basename $(img))

$(thumb): $(doc)
	pdftocairo -png -r $(thumbres) -singlefile $(doc) $(basename $(thumb))

clean:
	rm -f $(doc) *.log *.aux *.out
	rm -rf auto

.PHONY: clean all
