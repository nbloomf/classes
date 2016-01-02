all: FORCE
	# TARGETS:
	#   make aa   - Abstract Algebra
	#   make ca   - College Algebra
	#   make geom - College Geometry
	#   make calc - Calculus 1
	#   make stat - Statistics


aa: FORCE
	# Syllabus
	$(call copy,abstract,syllabus,nsulogo.png)
	$(call document,abstract,syllabus,syllabus)

	# Slides
	$(call slides,abstract,zz-axioms)

	# Homework
	$(call document,abstract,homework,hw2)

	# Tests
	$(call document,abstract,homework,final)


geom: FORCE
	# Syllabus
	$(call copy,geom,syllabus,nsulogo.png)
	$(call document,geom,syllabus,syllabus)

	# Activities
	$(call document,geom,activity,a1-basic-constructions)
	$(call document,geom,activity,a2-hyperbolic-constructions)
	$(call document,geom,activity,a3-symmetries-of-the-square)


ca: FORCE
	# Syllabus
	$(call copy,ca,syllabus,nsulogo.png)
	$(call document,ca,syllabus,syllabus09)
	$(call document,ca,syllabus,syllabus10)

	# Homework
	$(call document,ca,homework,h01-linear-equations)
	$(call document,ca,homework,h02-quadratic-equations)
	$(call document,ca,homework,h03-lines-and-circles)

	# Activities
	$(call document,ca,activity,a1-lines-and-circles)
	$(call document,ca,activity,a2-transformations)
	$(call document,ca,activity,a3-polynomials-1)
	$(call document,ca,activity,a4-polynomials-2)
	$(call document,ca,activity,a5-polynomials-3)
	$(call document,ca,activity,a6-rational-functions)

	# Reviews
	$(call document,ca,review,r0-prereq)
	$(call document,ca,review,r1-equations)
	$(call document,ca,review,r2-graphs-and-functions)
	$(call document,ca,review,r3-polynomials-and-conics)

	# Tests
	$(call document,ca,test,t1-equations)
	$(call document,ca,test,t2-graphs-and-functions)
	$(call document,ca,test,t3-polynomials-and-conics)


calc: FORCE
	# Activities
	$(call document,calc,activity,a01-limits)
	$(call document,calc,activity,a02-continuity)
	$(call document,calc,activity,a03-differentiation-1)
	$(call document,calc,activity,a04-differentiation-2)

	$(call solution,calc,activity,a01-limits)
	$(call solution,calc,activity,a02-continuity)
	$(call solution,calc,activity,a03-differentiation-1)
	$(call solution,calc,activity,a04-differentiation-2)


stat: FORCE


FORCE:



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



define solution
  # Run through feivel
  cat $(1)/fvl/$(2)/$(3).fvl \
   | sed 's/@SHOWSOLN := #f/@SHOWSOLN := #t/' \
   | feivel \
   | tee error \
   > $(1)/tex/$(2)/$(3)-sol.tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/$(2)/$(3)-sol.tex
  pdflatex -interaction=batchmode $(1)/tex/$(2)/$(3)-sol.tex
  mv $(3)-sol.pdf $(1)

  # Clean up
  rm $(3)-sol.aux $(3)-sol.log
  rm -f error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/$(2)/$(3)-sol\033[0m"
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
