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
  abstract/01-induction-and-wop.pdf \
  abstract/02-division-algorithm.pdf \
  abstract/03-divisibility-and-gcd.pdf \
  abstract/04-bezouts-identity.pdf \
  abstract/05-primes-and-factorization.pdf \
  abstract/06-relations-and-functions.pdf \
  abstract/07-equivalence-relations.pdf \
  abstract/08-modular-arithmetic.pdf \
  abstract/09-congruences.pdf \
  abstract/10-the-euler-totient.pdf \
  abstract/zz-axioms-screen.pdf

abstract/syllabus.pdf: abstract/fvl/syllabus/syllabus.fvl
	$(call copy,abstract,syllabus,nsulogo.png)
	$(call document,abstract,syllabus,syllabus)

abstract/01-induction-and-wop.pdf: abstract/fvl/notes/01-induction-and-wop.fvl
	$(call document,abstract,notes,01-induction-and-wop)

abstract/02-division-algorithm.pdf: abstract/fvl/notes/02-division-algorithm.fvl
	$(call document,abstract,notes,02-division-algorithm)

abstract/03-divisibility-and-gcd.pdf: abstract/fvl/notes/03-divisibility-and-gcd.fvl
	$(call document,abstract,notes,03-divisibility-and-gcd)

abstract/04-bezouts-identity.pdf: abstract/fvl/notes/04-bezouts-identity.fvl
	$(call document,abstract,notes,04-bezouts-identity)

abstract/05-primes-and-factorization.pdf: abstract/fvl/notes/05-primes-and-factorization.fvl
	$(call document,abstract,notes,05-primes-and-factorization)

abstract/06-relations-and-functions.pdf: abstract/fvl/notes/06-relations-and-functions.fvl
	$(call document,abstract,notes,06-relations-and-functions)

abstract/07-equivalence-relations.pdf: abstract/fvl/notes/07-equivalence-relations.fvl
	$(call document,abstract,notes,07-equivalence-relations)

abstract/08-modular-arithmetic.pdf: abstract/fvl/notes/08-modular-arithmetic.fvl
	$(call document,abstract,notes,08-modular-arithmetic)

abstract/09-congruences.pdf: abstract/fvl/notes/09-congruences.fvl
	$(call document,abstract,notes,09-congruences)

abstract/10-the-euler-totient.pdf: abstract/fvl/notes/10-the-euler-totient.fvl
	$(call document,abstract,notes,10-the-euler-totient)

abstract/zz-axioms-screen.pdf: abstract/fvl/slides/zz-axioms.fvl
	$(call slides,abstract,zz-axioms)



geo: \
  geom/syllabus.pdf \
  geom/01-incidence-structures.pdf \
  geom/02-incidence-geometries.pdf \
  geom/03-parallel-lines.pdf \
  geom/04-betweenness.pdf \
  geom/05-plane-separation.pdf \
  geom/06-angles.pdf

geom/syllabus.pdf: geom/fvl/syllabus/syllabus.fvl
	$(call copy,geom,syllabus,nsulogo.png)
	$(call document,geom,syllabus,syllabus)

geom/01-incidence-structures.pdf: geom/fvl/notes/01-incidence-structures.fvl
	$(call document,geom,notes,01-incidence-structures)

geom/02-incidence-geometries.pdf: geom/fvl/notes/02-incidence-geometries.fvl
	$(call document,geom,notes,02-incidence-geometries)

geom/03-parallel-lines.pdf: geom/fvl/notes/03-parallel-lines.fvl
	$(call document,geom,notes,03-parallel-lines)

geom/04-betweenness.pdf: geom/fvl/notes/04-betweenness.fvl
	$(call document,geom,notes,04-betweenness)

geom/05-plane-separation.pdf: geom/fvl/notes/05-plane-separation.fvl
	$(call document,geom,notes,05-plane-separation)

geom/06-angles.pdf: geom/fvl/notes/06-angles.fvl
	$(call document,geom,notes,06-angles)


ca: \
  ca/syllabus09.pdf \
  ca/h01-linear-equations.pdf \
  ca/r0-prereq.pdf

ca/syllabus09.pdf: ca/fvl/syllabus/syllabus09.fvl ca/fvl/syllabus/syllabus10.fvl
	$(call copy,ca,syllabus,nsulogo.png)
	$(call document,ca,syllabus,syllabus09)
	$(call document,ca,syllabus,syllabus10)

ca/h01-linear-equations.pdf: ca/fvl/homework/h01-linear-equations.fvl
	$(call document,ca,homework,h01-linear-equations)

ca/r0-prereq.pdf: ca/fvl/review/r0-prereq.fvl
	$(call document,ca,review,r0-prereq)
