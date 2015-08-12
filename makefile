maketex  = pdflatex $(1)/$(2).tex; pdflatex $(1)/$(2).tex; mv $(2).pdf $(1)
cleantex = rm $(1).aux $(1).log $(1).nav $(1).out $(1).snm $(1).toc

alg-slides: FORCE
	$(call maketex,abstract/slides,zz-axioms)
	$(call cleantex,zz-axioms)

FORCE:
