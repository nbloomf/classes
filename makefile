define document
  # Run through feivel
  feivel -t $(1)/fvl/$(2)/$(3).fvl \
   | tee error \
   > $(1)/tex/$(2)/$(3).tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/$(2)/$(3).tex
  pdflatex -interaction=batchmode $(1)/tex/$(2)/$(3).tex
  mv $(3).pdf $(1)

  # Clean up
  rm $(3).aux $(3).log
  rm -f error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/$(2)/$(3)\033[0m"
endef



define slides
  # Run through feivel
  feivel -t $(1)/fvl/slides/$(2).fvl \
   | tee error \
   > $(1)/tex/slides/$(2).tex

  # Split into screen and print versions
  cat $(1)/tex/slides/$(2).tex \
    | sed s/class\{beamer\}/class\[handout\]\{beamer\}/ \
    | sed s/colortheme\{default\}/colortheme\{dove\}/ \
    > $(1)/tex/slides/$(2)-print.tex
  mv $(1)/tex/slides/$(2).tex $(1)/tex/slides/$(2)-screen.tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/slides/$(2)-print.tex
  pdflatex -interaction=batchmode $(1)/tex/slides/$(2)-print.tex
  mv $(2)-print.pdf $(1)

  pdflatex -interaction=batchmode $(1)/tex/slides/$(2)-screen.tex
  pdflatex -interaction=batchmode $(1)/tex/slides/$(2)-screen.tex
  mv $(2)-screen.pdf $(1)

  # Clean up
  rm -- $(2)-print.aux $(2)-print.log
  rm -- $(2)-print.nav $(2)-print.out $(2)-print.snm $(2)-print.toc

  rm -- $(2)-screen.aux $(2)-screen.log
  rm -- $(2)-screen.nav $(2)-screen.out $(2)-screen.snm $(2)-screen.toc
  rm error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/slides/$(2)\033[0m"
endef



define copy
  cp $(1)/fvl/$(2)/$(3) $(1)/tex/$(2)/$(3)
endef



all: aa geo ca



aa: \
  abstract/syllabus.pdf \
  abstract/02-division-algorithm.pdf \
  abstract/zz-axioms-screen.pdf

abstract/syllabus.pdf: abstract/fvl/syllabus/syllabus.fvl
	$(call copy,abstract,syllabus,nsulogo.png)
	$(call document,abstract,syllabus,syllabus)

abstract/02-division-algorithm.pdf: abstract/fvl/notes/02-division-algorithm.fvl
	$(call document,abstract,notes,02-division-algorithm)

abstract/zz-axioms-screen.pdf: abstract/fvl/slides/zz-axioms.fvl
	$(call slides,abstract,zz-axioms)



geo: \
  geom/syllabus.pdf \
  geom/01-incidence-structures.pdf

geom/syllabus.pdf: geom/fvl/syllabus/syllabus.fvl
	$(call copy,geom,syllabus,nsulogo.png)
	$(call document,geom,syllabus,syllabus)

geom/01-incidence-structures.pdf: geom/fvl/notes/01-incidence-structures.fvl
	$(call document,geom,notes,01-incidence-structures)



ca: \
  ca/syllabus09.pdf \
  ca/r0-prereq.pdf

ca/syllabus09.pdf: ca/fvl/syllabus/syllabus09.fvl ca/fvl/syllabus/syllabus10.fvl
	$(call copy,ca,syllabus,nsulogo.png)
	$(call document,ca,syllabus,syllabus09)
	$(call document,ca,syllabus,syllabus10)

ca/r0-prereq.pdf: ca/fvl/review/r0-prereq.fvl
	$(call document,ca,review,r0-prereq)
