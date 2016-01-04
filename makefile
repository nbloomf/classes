all: FORCE
	# TARGETS:
	#   make coal    - College Algebra
	#   make stat    - Statistics
	#   make calc    - Calculus 1
        #   make prfs    - Intro to Proof
	#   make geom    - College Geometry
	#   make ring    - Abstract Algebra (Rings)
	#   make courses - Everything


courses: ring coal geom calc stat prfs


ring: FORCE
	mkdir -p ring/tex

	# Syllabus
	$(call copy,ring,nsulogo.png)
	$(call document,ring,syllabus)

	# Slides
	$(call slides,ring,slides-zz-axioms)

	# Homework
	$(call document,ring,hw2)

	# Tests
	$(call document,ring,final)

	# Remove generated files
	rm -rf ring/tex


geom: FORCE
	mkdir -p geom/tex

	# Syllabus
	$(call copy,geom,nsulogo.png)
	$(call document,geom,syllabus)

	# Activities
	$(call document,geom,a1-basic-constructions)
	$(call document,geom,a2-hyperbolic-constructions)
	$(call document,geom,a3-symmetries-of-the-square)

	# Remove generated files
	rm -rf geom/tex


coal: FORCE
	mkdir -p coal/tex

	# Syllabus
	$(call copy,coal,nsulogo.png)
	$(call document,coal,syllabus09)
	$(call document,coal,syllabus10)

	# Homework
	$(call document,coal,h01-linear-equations)
	$(call document,coal,h02-quadratic-equations)
	$(call document,coal,h03-lines-and-circles)

	# Activities
	$(call document,coal,a1-lines-and-circles)
	$(call document,coal,a2-transformations)
	$(call document,coal,a3-polynomials-1)
	$(call document,coal,a4-polynomials-2)
	$(call document,coal,a5-polynomials-3)
	$(call document,coal,a6-rational-functions)

	# Reviews
	$(call document,coal,r0-prereq)
	$(call document,coal,r1-equations)
	$(call document,coal,r2-graphs-and-functions)
	$(call document,coal,r3-polynomials-and-conics)

	# Tests
	$(call document,coal,t1-equations)
	$(call document,coal,t2-graphs-and-functions)
	$(call copy,coal,coconut.png)
	$(call document,coal,t3-polynomials-and-conics)

	# Remove generated files
	rm -rf coal/tex


calc: FORCE
	mkdir -p calc/tex

	# Syllabus
	$(call copy,calc,nsulogo.png)
	$(call document,calc,syllabus)

	# Activities
	$(call document,calc,a01-limits)
	$(call document,calc,a02-continuity)
	$(call document,calc,a03-differentiation-1)
	$(call document,calc,a04-differentiation-2)

	$(call solution,calc,a01-limits)
	$(call solution,calc,a02-continuity)
	$(call solution,calc,a03-differentiation-1)
	$(call solution,calc,a04-differentiation-2)

	# Remove generated files
	rm -rf calc/tex


stat: FORCE
	mkdir -p stat/tex
	cp -r stat/fvl/gfx/ stat/tex/

	# Syllabus
	$(call document,stat,syllabus9)
	$(call document,stat,syllabus1)

	# Activities
	$(call document,stat,a01-basic-parameters)
	$(call document,stat,a02-probability)

	$(call solution,stat,a01-basic-parameters)
	$(call solution,stat,a02-probability)

	# Slides
	$(call slides,stat,slides-binomial-rv)
	$(call slides,stat,slides-misleading-graphs)

	# Remove generated files
	rm -rf stat/tex


prfs: FORCE
	mkdir -p prfs/tex
	cp -r prfs/fvl/gfx/ prfs/tex/

	# Syllabus
	$(call document,prfs,syllabus)


FORCE:



define document
  # Run through feivel
  feivel -t $(1)/fvl/$(2).fvl \
   | tee error \
   > $(1)/tex/$(2).tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/$(2).tex
  pdflatex -interaction=batchmode $(1)/tex/$(2).tex
  mv $(2).pdf $(1)/$(1)-$(2).pdf

  # Clean up
  rm $(2).aux $(2).log
  rm -f error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/$(2)\033[0m"
endef



define solution
  # Run through feivel after changing SHOWSOLN flag
  cat $(1)/fvl/$(2).fvl \
   | sed 's/@SHOWSOLN := #f/@SHOWSOLN := #t/' \
   | feivel \
   | tee error \
   > $(1)/tex/soln-$(2).tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/soln-$(2).tex
  pdflatex -interaction=batchmode $(1)/tex/soln-$(2).tex
  mv soln-$(2).pdf $(1)/$(1)-soln-$(2).pdf

  # Clean up
  rm soln-$(2).aux soln-$(2).log
  rm -f error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/soln-$(2)\033[0m"
endef



define slides
  # Run through feivel
  feivel -t $(1)/fvl/$(2).fvl \
   | tee error \
   > $(1)/tex/$(2).tex

  # Split into screen and print versions
  cat $(1)/tex/$(2).tex \
    | sed s/class\{beamer\}/class\[handout\]\{beamer\}/ \
    | sed s/colortheme\{default\}/colortheme\{dove\}/ \
    > $(1)/tex/$(2)-print.tex
  mv $(1)/tex/$(2).tex $(1)/tex/$(2)-screen.tex

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex
  pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex
  mv $(2)-print.pdf $(1)/$(1)-print-$(2).pdf

  pdflatex -interaction=batchmode $(1)/tex/$(2)-screen.tex
  pdflatex -interaction=batchmode $(1)/tex/$(2)-screen.tex
  mv $(2)-screen.pdf $(1)/$(1)-screen-$(2).pdf

  # Clean up
  rm -- $(2)-print.aux $(2)-print.log
  rm -- $(2)-print.nav $(2)-print.out $(2)-print.snm $(2)-print.toc

  rm -- $(2)-screen.aux $(2)-screen.log
  rm -- $(2)-screen.nav $(2)-screen.out $(2)-screen.snm $(2)-screen.toc
  rm error

  echo -e "\033[1;32mSuccessfully built $(1)/fvl/$(2)\033[0m"
endef



define copy
  cp $(1)/fvl/$(2) $(1)/tex/$(2)
endef
