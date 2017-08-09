TEXMK := latexmk
TEXMKFLAGS := -g -pdf
TEX := tex

all: kres.pdf kres.cls

kres.pdf: kres.dtx
	$(TEXMK) $(TEXMKFLAGS) $<

kres.cls: kres.ins kres.dtx
	$(TEX) $<

kres.zip: README.md kres.ins kres.dtx kres.pdf
	mkdir -p kres
	cp $^ kres
	zip -r kres.zip kres

install: kres.cls
	install -D -m 640 $< \
	$(shell kpsexpand '$$TEXMFHOME')/tex/latex/kres.cls

dist: kres.zip

sweep:
	rm -f *.{log,aux,out,glo,hd,idx,fdb_latexmk,fls,ilg,ind}
	rm -rf kres/

clean: sweep
	rm -f *.{pdf,cls,tex,zip}
	rm -rf auto/

.PHONY: all install dist sweep clean
