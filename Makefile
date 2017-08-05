TEXMK := latexmk
TEXMKFLAGS := -g -pdf
TEX := tex

all: kres.pdf kres.cls

kres.pdf: kres.dtx
	$(TEXMK) $(TEXMKFLAGS) $<

kres.cls: kres.ins kres.dtx
	$(TEX) $<

sweep:
	rm -f *.{log,aux,out,glo,hd,idx,fdb_latexmk,fls,ilg,ind}

clean: sweep
	rm -f *.{pdf,cls,tex}
	rm -rf auto/

.PHONY: all sweep clean
