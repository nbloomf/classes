help: FORCE
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

	$(call solution,coal,a01-linear-ish-equations)
	$(call solution,coal,a02-some-geometry)
	$(call solution,coal,a03-compound-equations)
	$(call solution,coal,a04-functions)

	# Reviews
	$(call document,coal,r1-equations-and-geometry)

	$(call solution,coal,r1-equations-and-geometry)

	# Tests
	$(call document,coal,t1-equations-and-geometry)

	$(call solution,coal,t1-equations-and-geometry)

	# Remove generated files
	rm -rf coal/tex

	@echo "Done!" | doppler lightgreen


stat: FORCE
	mkdir -p stat/tex
	cp -r stat/fvl/gfx/ stat/tex/

	# Syllabus
	$(call document,stat,syllabus)

	# Activities
	$(call document,stat,a01-basic-parameters)
	$(call document,stat,a02-probability)
	$(call document,stat,a03-counting)

	$(call solution,stat,a01-basic-parameters)
	$(call solution,stat,a02-probability)

	# Reviews
	$(call document,stat,r1-parameters-and-probability)

	$(call solution,stat,r1-parameters-and-probability)

	# Tests
	$(call document,stat,t1-parameters-and-probability)

	# Slides
	$(call slides,stat,slides-misleading-graphs)

	# Remove generated files
	rm -rf stat/tex

	@echo "Done!" | doppler lightgreen


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

	# Reviews
	$(call document,calc,r1-limits-and-derivatives)

	$(call solution,calc,r1-limits-and-derivatives)

	# Tests
	$(call document,calc,t1-limits-and-derivatives)

	# Remove generated files
	rm -rf calc/tex

	@echo "Done!" | doppler lightgreen


prfs: FORCE
	mkdir -p prfs/tex
	cp -r prfs/fvl/gfx/ prfs/tex/

	# Syllabus
	$(call document,prfs,syllabus)

	# Homework
	$(call document,prfs,h01-statements-and-quantifiers)
	$(call document,prfs,h02-union-and-intersection)

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
