TEXMK := latexmk
TEXMKFLAGS := -g -pdf
TEX := tex

all: kres.pdf kres.cls

kres.pdf: kres.dtx
	$(TEXMK) $(TEXMKFLAGS) $<

kres.cls: kres.ins kres.dtx
	$(TEX) $<

install: kres.cls
	install -D -m 640 $< \
	$(shell kpsexpand '$$TEXMFHOME')/tex/latex/kres.cls

sweep:
	rm -f *.{log,aux,out,glo,hd,idx,fdb_latexmk,fls,ilg,ind}

clean: sweep
	rm -f *.{pdf,cls,tex}
	rm -rf auto/

.PHONY: all install sweep clean
