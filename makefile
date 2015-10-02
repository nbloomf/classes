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
  abstract/10a-pythagorean-triples.pdf \
  abstract/11-rings.pdf \
  abstract/12-homomorphisms.pdf \
  abstract/14-subrings.pdf \
  abstract/13-direct-sums.pdf \
  abstract/15-domains-and-fields.pdf \
  abstract/16-divisibility.pdf \
  abstract/17-gcd-domains.pdf \
  abstract/18-factorization.pdf \
  abstract/19-division-with-remainder.pdf \
  abstract/20-localization.pdf \
  abstract/21-polynomials.pdf \
  abstract/zz-axioms-screen.pdf \
  abstract/hw2.pdf

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

abstract/10a-pythagorean-triples.pdf: abstract/fvl/notes/10a-pythagorean-triples.fvl
	$(call document,abstract,notes,10a-pythagorean-triples)

abstract/11-rings.pdf: abstract/fvl/notes/11-rings.fvl
	$(call document,abstract,notes,11-rings)

abstract/12-homomorphisms.pdf: abstract/fvl/notes/12-homomorphisms.fvl
	$(call document,abstract,notes,12-homomorphisms)

abstract/14-subrings.pdf: abstract/fvl/notes/14-subrings.fvl
	$(call document,abstract,notes,14-subrings)

abstract/13-direct-sums.pdf: abstract/fvl/notes/13-direct-sums.fvl
	$(call document,abstract,notes,13-direct-sums)

abstract/15-domains-and-fields.pdf: abstract/fvl/notes/15-domains-and-fields.fvl
	$(call document,abstract,notes,15-domains-and-fields)

abstract/16-divisibility.pdf: abstract/fvl/notes/16-divisibility.fvl
	$(call document,abstract,notes,16-divisibility)

abstract/17-gcd-domains.pdf: abstract/fvl/notes/17-gcd-domains.fvl
	$(call document,abstract,notes,17-gcd-domains)

abstract/18-factorization.pdf: abstract/fvl/notes/18-factorization.fvl
	$(call document,abstract,notes,18-factorization)

abstract/19-division-with-remainder.pdf: abstract/fvl/notes/19-division-with-remainder.fvl
	$(call document,abstract,notes,19-division-with-remainder)

abstract/20-localization.pdf: abstract/fvl/notes/20-localization.fvl
	$(call document,abstract,notes,20-localization)

abstract/21-polynomials.pdf: abstract/fvl/notes/21-polynomials.fvl
	$(call document,abstract,notes,21-polynomials)

abstract/zz-axioms-screen.pdf: abstract/fvl/slides/zz-axioms.fvl
	$(call slides,abstract,zz-axioms)

abstract/hw2.pdf: abstract/fvl/homework/hw2.fvl
	$(call document,abstract,homework,hw2)



geo: \
  geom/syllabus.pdf \
  geom/01-incidence-structures.pdf \
  geom/02-incidence-geometries.pdf \
  geom/03-parallel-lines.pdf \
  geom/04-betweenness.pdf \
  geom/05-plane-separation.pdf \
  geom/06-angles.pdf \
  geom/07-congruence.pdf \
  geom/08-circles.pdf \
  geom/09-plane-geometries.pdf \
  geom/10-transversals.pdf \
  geom/11-perpendiculars-and-tangents.pdf \
  geom/a1-basic-constructions.pdf

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

geom/07-congruence.pdf: geom/fvl/notes/07-congruence.fvl
	$(call document,geom,notes,07-congruence)

geom/08-circles.pdf: geom/fvl/notes/08-circles.fvl
	$(call document,geom,notes,08-circles)

geom/09-plane-geometries.pdf: geom/fvl/notes/09-plane-geometries.fvl
	$(call document,geom,notes,09-plane-geometries)

geom/10-transversals.pdf: geom/fvl/notes/10-transversals.fvl
	$(call document,geom,notes,10-transversals)

geom/11-perpendiculars-and-tangents.pdf: geom/fvl/notes/11-perpendiculars-and-tangents.fvl
	$(call document,geom,notes,11-perpendiculars-and-tangents)

geom/a1-basic-constructions.pdf: geom/fvl/activity/a1-basic-constructions.fvl
	$(call document,geom,activity,a1-basic-constructions)


ca: \
  ca/syllabus09.pdf \
  ca/h01-linear-equations.pdf \
  ca/h02-quadratic-equations.pdf \
  ca/h03-lines-and-circles.pdf \
  ca/a1-lines-and-circles.pdf \
  ca/r0-prereq.pdf \
  ca/r1-equations.pdf \
  ca/t1-equations.pdf

ca/syllabus09.pdf: ca/fvl/syllabus/syllabus09.fvl ca/fvl/syllabus/syllabus10.fvl
	$(call copy,ca,syllabus,nsulogo.png)
	$(call document,ca,syllabus,syllabus09)
	$(call document,ca,syllabus,syllabus10)

ca/h01-linear-equations.pdf: ca/fvl/homework/h01-linear-equations.fvl
	$(call document,ca,homework,h01-linear-equations)

ca/h02-quadratic-equations.pdf: ca/fvl/homework/h02-quadratic-equations.fvl
	$(call document,ca,homework,h02-quadratic-equations)

ca/h03-lines-and-circles.pdf: ca/fvl/homework/h03-lines-and-circles.fvl
	$(call document,ca,homework,h03-lines-and-circles)

ca/a1-lines-and-circles.pdf: ca/fvl/activity/a1-lines-and-circles.fvl
	$(call document,ca,activity,a1-lines-and-circles)

ca/r0-prereq.pdf: ca/fvl/review/r0-prereq.fvl
	$(call document,ca,review,r0-prereq)

ca/r1-equations.pdf: ca/fvl/review/r1-equations.fvl
	$(call document,ca,review,r1-equations)

ca/t1-equations.pdf: ca/fvl/test/t1-equations.fvl
	$(call document,ca,test,t1-equations)
