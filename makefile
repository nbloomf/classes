targets: FORCE
	# TARGETS:
	#   make coal - College Algebra
	#   make stat - Statistics
	#   make calc - Calculus 1
        #   make prfs - Intro to Proof
	#   make geom - College Geometry
	#   make ring - Abstract Algebra (Rings)
	#   make all  - Everything


s15: coal stat calc

all: coal stat calc prfs geom ring


coal: FORCE
	mkdir -p coal/tex

	# Syllabus
	$(call copy,coal,nsulogo.png)
	$(call document,coal,syllabus)

	# Activities
	$(call document,coal,a01-linear-ish-equations)
	$(call document,coal,a02-some-geometry)
	$(call document,coal,a03-compound-equations)
	$(call document,coal,a04-functions)
	$(call document,coal,a05-transformations)
	$(call document,coal,a06-polynomials)
	$(call document,coal,a07-polynomials-ii)
	$(call document,coal,a08-exponentials-and-logs)

	$(call solution,coal,a01-linear-ish-equations)
	$(call solution,coal,a02-some-geometry)
	$(call solution,coal,a03-compound-equations)
	$(call solution,coal,a04-functions)
	$(call solution,coal,a05-transformations)

	# Reviews
	$(call document,coal,r1-equations-and-geometry)
	$(call document,coal,r2-functions)
	$(call document,coal,r3-polynomials)

	$(call solution,coal,r1-equations-and-geometry)

	# Tests
	$(call document,coal,t1-equations-and-geometry)
	$(call document,coal,t2-functions)
	$(call document,coal,t3-polynomials)

	$(call solution,coal,t1-equations-and-geometry)

	# Remove generated files
	rm -rf coal/tex

	@echo "Done!" | doppler lightgreen


stat: FORCE
	mkdir -p stat/tex
	cp -r stat/fvl/gfx/ stat/tex/

	# Tables
	$(call plaintex,stat,tables,z-score-table)

	# Syllabus
	$(call document,stat,syllabus)

	# Activities
	$(call document,stat,a01-basic-parameters)
	$(call document,stat,a02-probability)
	$(call document,stat,a03-counting)
	$(call document,stat,a04-discrete-random-variables)
	$(call document,stat,a05-discrete-random-variables-ii)
	$(call document,stat,a06-normal-random-variables)
	$(call document,stat,a07-sampling-distributions)

	$(call solution,stat,a01-basic-parameters)
	$(call solution,stat,a02-probability)

	# Reviews
	$(call document,stat,r1-parameters-and-probability)
	$(call document,stat,r2-counting-and-drvs)
	$(call document,stat,r3-continuous-rvs)

	$(call solution,stat,r1-parameters-and-probability)

	# Tests
	$(call document,stat,t1-parameters-and-probability)
	$(call document,stat,t2-counting-and-drvs)
	$(call document,stat,t3-continuous-rvs)
	$(call document,stat,t4-inference)

	# Slides
	$(call slides,stat,slides-misleading-graphs)

	# Remove generated files
	rm -rf stat/tex

	@echo "Done!" | doppler lightgreen





calc: \
  calc/calc-syllabus.pdf \
  calc-activities \
  calc-reviews \
  calc-tests



calc/calc-syllabus.pdf: calc/fvl/syllabus.fvl
	mkdir -p calc/tex
	$(call copy,calc,nsulogo.png)
	$(call document,calc,syllabus)
	rm -rf calc/tex



calc-activities: \
  calc/calc-a01-limits.pdf \
  calc/calc-a02-continuity.pdf \
  calc/calc-a03-differentiation-1.pdf \
  calc/calc-a04-differentiation-2.pdf \
  calc/calc-a05-differentiation-3.pdf \
  calc/calc-a06-monotonicity-and-concavity.pdf \
  calc/calc-a07-extrema.pdf \
  calc/calc-a08-applications.pdf \
  calc/calc-a09-integration.pdf

calc/calc-a01-limits.pdf: calc/fvl/a01-limits.fvl
	mkdir -p calc/tex
	$(call document,calc,a01-limits)
	$(call solution,calc,a01-limits)
	rm -rf calc/tex

calc/calc-a02-continuity.pdf: calc/fvl/a02-continuity.fvl
	mkdir -p calc/tex
	$(call document,calc,a02-continuity)
	$(call solution,calc,a02-continuity)
	rm -rf calc/tex

calc/calc-a03-differentiation-1.pdf: calc/fvl/a03-differentiation-1.fvl
	mkdir -p calc/tex
	$(call document,calc,a03-differentiation-1)
	$(call solution,calc,a03-differentiation-1)
	rm -rf calc/tex

calc/calc-a04-differentiation-2.pdf: calc/fvl/a04-differentiation-2.fvl
	mkdir -p calc/tex
	$(call document,calc,a04-differentiation-2)
	$(call solution,calc,a04-differentiation-2)
	rm -rf calc/tex

calc/calc-a05-differentiation-3.pdf: calc/fvl/a05-differentiation-3.fvl
	mkdir -p calc/tex
	$(call document,calc,a05-differentiation-3)
	rm -rf calc/tex

calc/calc-a06-monotonicity-and-concavity.pdf: calc/fvl/a06-monotonicity-and-concavity.fvl
	mkdir -p calc/tex
	$(call document,calc,a06-monotonicity-and-concavity)
	rm -rf calc/tex

calc/calc-a07-extrema.pdf: calc/fvl/a07-extrema.fvl
	mkdir -p calc/tex
	$(call document,calc,a07-extrema)
	rm -rf calc/tex

calc/calc-a08-applications.pdf: calc/fvl/a08-applications.fvl
	mkdir -p calc/tex
	$(call document,calc,a08-applications)
	rm -rf calc/tex

calc/calc-a09-integration.pdf: calc/fvl/a09-integration.fvl
	mkdir -p calc/tex
	$(call document,calc,a09-integration)
	rm -rf calc/tex



calc-reviews: \
  calc/calc-r1-limits-and-derivatives.pdf \
  calc/calc-r2-differentiation.pdf

calc/calc-r1-limits-and-derivatives.pdf: calc/fvl/r1-limits-and-derivatives.fvl
	mkdir -p calc/tex
	$(call document,calc,r1-limits-and-derivatives)
	$(call solution,calc,r1-limits-and-derivatives)
	rm -rf calc/tex

calc/calc-r2-differentiation.pdf: calc/fvl/r2-differentiation.fvl
	mkdir -p calc/tex
	$(call document,calc,r2-differentiation)
	rm -rf calc/tex



calc-tests: \
  calc/calc-t1-limits-and-derivatives.pdf \
  calc/calc-t2-differentiation.pdf \
  calc/calc-t3-differentiation-ii.pdf \
  calc/calc-t4-integration.pdf

calc/calc-t1-limits-and-derivatives.pdf: calc/fvl/t1-limits-and-derivatives.fvl
	mkdir -p calc/tex
	$(call document,calc,t1-limits-and-derivatives)
	rm -rf calc/tex

calc/calc-t2-differentiation.pdf: calc/fvl/t2-differentiation.fvl
	mkdir -p calc/tex
	$(call document,calc,t2-differentiation)
	rm -rf calc/tex

calc/calc-t3-differentiation-ii.pdf: calc/fvl/t3-differentiation-ii.fvl
	mkdir -p calc/tex
	$(call document,calc,t3-differentiation-ii)
	rm -rf calc/tex

calc/calc-t4-integration.pdf: calc/fvl/t4-integration.fvl
	mkdir -p calc/tex
	$(call document,calc,t4-integration)
	rm -rf calc/tex





prfs: FORCE
	mkdir -p prfs/tex
	cp -r prfs/fvl/gfx/ prfs/tex/

	# Syllabus
	$(call document,prfs,syllabus)

	# Homework
	$(call document,prfs,h01-statements-and-quantifiers)
	$(call document,prfs,h02-union-and-intersection)

	# Tests
	$(call document,prfs,t01-sets)

	# Remove generated files
	rm -rf prfs/tex

	@echo "Done!" | doppler lightgreen


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

	@echo "Done!" | doppler lightgreen


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

	@echo "Done!" | doppler lightgreen


FORCE:



define plaintex
  @echo "Attempting to build $(1)/$(2)/$(3)" | doppler lightblue

  # Generate pdfs
  pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex
  pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex
  mv $(3).pdf $(1)/$(1)-$(3).pdf

  # Clean up
  rm $(3).aux $(3).log

  @echo "Successfully built $(1)/$(2)/$(3)" | doppler lightgreen
endef



define document
  @echo "Attempting to build $(1)/fvl/$(2)" | doppler lightblue

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

  @echo "Successfully built $(1)/fvl/$(2)" | doppler lightgreen
endef



define solution
  @echo "Attempting to build $(1)/fvl/soln-$(2)" | doppler lightblue

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

  @echo "Successfully built $(1)/fvl/soln-$(2)" | doppler lightgreen
endef



define slides
  @echo "Attempting to build $(1)/fvl/$(2)" | doppler lightblue

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

  @echo "Successfully built $(1)/fvl/$(2)" | doppler lightgreen
endef



define copy
  cp $(1)/fvl/$(2) $(1)/tex/$(2)
endef
