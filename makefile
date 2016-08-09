SHELL = /bin/bash

targets: FORCE
	@echo 'TARGETS:'                                  | doppler lightblue
	@echo '  make coal   - College Algebra'           | doppler lightblue
	@echo '  make stat   - Statistics'                | doppler lightblue
	@echo '  make calc   - Calculus 1'                | doppler lightblue
	@echo '  make prfs   - Intro to Proof'            | doppler lightblue
	@echo '  make geom   - College Geometry'          | doppler lightblue
	@echo '  make ring   - Modern Algebra (Rings)'    | doppler lightblue
	@echo '  make ssem   - Senior Seminar'            | doppler lightblue
	@echo
	@echo '  make all    - Everything'                | doppler lightblue
	@echo '  make clean  - Delete generated files'    | doppler lightblue
	@echo '  make tickle - Touch all files'           | doppler lightblue
	@echo
	@echo 'touch foo/tickle.me to force build foo'    | doppler lightblue

FORCE:

all: coal stat calc prfs geom ring ssem

clean: FORCE
	@(rm calc/pdf/* || true) 2> /dev/null
	@(rm calc/*.pdf || true) 2> /dev/null
	@(rm coal/pdf/* || true) 2> /dev/null
	@(rm coal/*.pdf || true) 2> /dev/null
	@(rm stat/pdf/* || true) 2> /dev/null
	@(rm stat/*.pdf || true) 2> /dev/null
	@(rm prfs/pdf/* || true) 2> /dev/null
	@(rm prfs/*.pdf || true) 2> /dev/null
	@(rm geom/pdf/* || true) 2> /dev/null
	@(rm geom/*.pdf || true) 2> /dev/null
	@(rm ring/pdf/* || true) 2> /dev/null
	@(rm ring/*.pdf || true) 2> /dev/null
	@(rm ssem/pdf/* || true) 2> /dev/null
	@(rm ssem/*.pdf || true) 2> /dev/null

tickle: FORCE
	@echo 'Tee Hee!' | doppler lightmagenta
	@touch coal/tickle.me
	@touch stat/tickle.me
	@touch calc/tickle.me
	@touch geom/tickle.me
	@touch ring/tickle.me
	@touch ssem/tickle.me
	@touch prfs/tickle.me








coal: \
  coal-title \
  coal/coal-syllabus.pdf \
  $(patsubst coal/fvl/a%.fvl,coal/coal-a%.pdf,$(wildcard coal/fvl/a*.fvl)) \
  $(patsubst coal/fvl/r%.fvl,coal/coal-r%.pdf,$(wildcard coal/fvl/r*.fvl)) \
  $(patsubst coal/fvl/t%.fvl,coal/coal-t%.pdf,$(wildcard coal/fvl/t*.fvl))


coal-title: FORCE
	@echo ' _______  _______  _______  ___     ' | doppler green
	@echo '|       ||       ||   _   ||   |    ' | doppler green
	@echo '|       ||   _   ||  |_|  ||   |    ' | doppler green
	@echo '|       ||  | |  ||       ||   |    ' | doppler green
	@echo '|      _||  |_|  ||       ||   |___ ' | doppler green
	@echo '|     |_ |       ||   _   ||       |' | doppler green
	@echo '|_______||_______||__| |__||_______|' | doppler green


coal/.that.tickles: coal/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch coal/.that.tickles


coal/coal-syllabus.pdf: \
  coal/fvl/syllabus.fvl \
  coal/.that.tickles
	@mkdir -p coal/tex
	$(call copy,coal,nsulogo.png)
	$(call document,coal,syllabus)
	@rm -rf coal/tex


coal/coal-a%.pdf: \
  coal/fvl/a%.fvl \
  coal/.that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a$*)
	$(call solution,coal,a$*)	
	@rm -rf coal/tex


coal/coal-r%.pdf: \
  coal/fvl/r%.fvl \
  coal/.that.tickles
	@mkdir -p coal/tex
	$(call document,coal,r$*)
	$(call solution,coal,r$*)	
	@rm -rf coal/tex


coal/coal-t%.pdf: \
  coal/fvl/t%.fvl \
  coal/.that.tickles
	@mkdir -p coal/tex
	$(call document,coal,t$*)
	$(call solution,coal,t$*)	
	@rm -rf coal/tex








stat: \
  stat-title \
  stat/stat-syllabus.pdf \
  stat/stat-z-score-table.pdf \
  $(patsubst stat/fvl/a%.fvl,stat/stat-a%.pdf,$(wildcard stat/fvl/a*.fvl)) \
  $(patsubst stat/fvl/r%.fvl,stat/stat-r%.pdf,$(wildcard stat/fvl/r*.fvl)) \
  $(patsubst stat/fvl/t%.fvl,stat/stat-t%.pdf,$(wildcard stat/fvl/t*.fvl)) \
  $(patsubst stat/fvl/s%.fvl,stat/stat-s%.pdf,$(wildcard stat/fvl/s*.fvl))


stat-title: FORCE
	@echo ' _______  _______  _______  _______ ' | doppler green
	@echo '|       ||       ||   _   ||       |' | doppler green
	@echo '|  _____||_     _||  |_|  ||_     _|' | doppler green
	@echo '| |_____   |   |  |       |  |   |  ' | doppler green
	@echo '|_____  |  |   |  |       |  |   |  ' | doppler green
	@echo ' _____| |  |   |  |   _   |  |   |  ' | doppler green
	@echo '|_______|  |___|  |__| |__|  |___|  ' | doppler green


stat/.that.tickles: stat/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch stat/.that.tickles


stat/stat-syllabus.pdf: \
  stat/fvl/syllabus.fvl \
  stat/.that.tickles
	@mkdir -p stat/tex/gfx
	$(call copy,stat,gfx/nsulogo.png)
	$(call document,stat,syllabus)
	@rm -rf stat/tex


stat/stat-z-score-table.pdf: \
  stat/tables/z-score-table.tex \
  stat/.that.tickles
	@mkdir -p stat/tex
	$(call plaintex,stat,tables,z-score-table)
	@rm -rf stat/tex


stat/stat-a%.pdf: \
  stat/fvl/a%.fvl \
  stat/.that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a$*)
	$(call solution,stat,a$*)	
	@rm -rf stat/tex


stat/stat-r%.pdf: \
  stat/fvl/r%.fvl \
  stat/.that.tickles
	@mkdir -p stat/tex
	$(call document,stat,r$*)
	$(call solution,stat,r$*)
	@rm -rf stat/tex


stat/stat-t%.pdf: \
  stat/fvl/t%.fvl \
  stat/.that.tickles
	@mkdir -p stat/tex
	$(call document,stat,t$*)
	$(call solution,stat,t$*)
	@rm -rf stat/tex


stat/stat-s%.pdf: \
  stat/fvl/s%.fvl \
  stat/.that.tickles
	@mkdir -p stat/tex/gfx
	$(call copy,stat,gfx/s$*/)
	$(call slides,stat,s$*)
	@rm -rf stat/tex








calc: \
  calc-title \
  calc/calc-syllabus.pdf \
  $(patsubst calc/fvl/a%.fvl,calc/calc-a%.pdf,$(wildcard calc/fvl/a*.fvl)) \
  $(patsubst calc/fvl/r%.fvl,calc/calc-r%.pdf,$(wildcard calc/fvl/r*.fvl)) \
  $(patsubst calc/fvl/t%.fvl,calc/calc-t%.pdf,$(wildcard calc/fvl/t*.fvl))


calc-title: FORCE
	@echo ' _______  _______  ___      _______ ' | doppler green
	@echo '|       ||   _   ||   |    |       |' | doppler green
	@echo '|       ||  |_|  ||   |    |       |' | doppler green
	@echo '|       ||       ||   |    |       |' | doppler green
	@echo '|      _||       ||   |___ |      _|' | doppler green
	@echo '|     |_ |   _   ||       ||     |_ ' | doppler green
	@echo '|_______||__| |__||_______||_______|' | doppler green


calc/.that.tickles: calc/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch calc/.that.tickles


calc/calc-syllabus.pdf: \
  calc/fvl/syllabus.fvl \
  calc/.that.tickles
	@mkdir -p calc/tex
	$(call copy,calc,nsulogo.png)
	$(call document,calc,syllabus)
	@rm -rf calc/tex


calc/calc-a%.pdf: \
  calc/fvl/a%.fvl \
  calc/.that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a$*)
	$(call solution,calc,a$*)	
	@rm -rf calc/tex


calc/calc-r%.pdf: \
  calc/fvl/r%.fvl \
  calc/.that.tickles
	@mkdir -p calc/tex
	$(call document,calc,r$*)
	$(call solution,calc,r$*)
	@rm -rf calc/tex


calc/calc-t%.pdf: \
  calc/fvl/t%.fvl \
  calc/.that.tickles
	@mkdir -p calc/tex
	$(call document,calc,t$*)
	$(call solution,calc,t$*)
	@rm -rf calc/tex








prfs: \
  prfs-title \
  prfs/prfs-syllabus.pdf \
  $(patsubst prfs/fvl/h%.fvl,prfs/prfs-h%.pdf,$(wildcard prfs/fvl/h*.fvl)) \
  $(patsubst prfs/fvl/t%.fvl,prfs/prfs-t%.pdf,$(wildcard prfs/fvl/t*.fvl))


prfs-title: FORCE
	@echo ' _______  ______    _______  _______ ' | doppler green
	@echo '|       ||    _ |  |       ||       |' | doppler green
	@echo '|    _  ||   | ||  |    ___||  _____|' | doppler green
	@echo '|   |_| ||   |_||_ |   |___ | |_____ ' | doppler green
	@echo '|    ___||    __  ||    ___||_____  |' | doppler green
	@echo '|   |    |   |  | ||   |     _____| |' | doppler green
	@echo '|___|    |___|  |_||___|    |_______|' | doppler green


prfs/.that.tickles: prfs/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch prfs/.that.tickles


prfs/prfs-syllabus.pdf: \
  prfs/fvl/syllabus.fvl \
  prfs/.that.tickles
	@mkdir -p prfs/tex/gfx
	$(call copy,prfs,gfx/nsulogo.png)
	$(call document,prfs,syllabus)
	@rm -rf prfs/tex


prfs/prfs-h%.pdf: \
  prfs/fvl/h%.fvl \
  prfs/.that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,h$*)
	@rm -rf prfs/tex


prfs/prfs-t%.pdf: \
  prfs/fvl/t%.fvl \
  prfs/.that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,t$*)
	@rm -rf prfs/tex








geom: \
  geom-title \
  geom/geom-syllabus.pdf \
  $(patsubst geom/fvl/t%.fvl,geom/geom-t%.pdf,$(wildcard geom/fvl/t*.fvl))


geom-title: FORCE
	@echo ' _______  _______  _______  __   __ ' | doppler green
	@echo '|       ||       ||       ||  |_|  |' | doppler green
	@echo '|    ___||    ___||   _   ||       |' | doppler green
	@echo '|   | __ |   |___ |  | |  ||       |' | doppler green
	@echo '|   ||  ||    ___||  |_|  ||       |' | doppler green
	@echo '|   |_| ||   |___ |       || ||_|| |' | doppler green
	@echo '|_______||_______||_______||_|   |_|' | doppler green


geom/.that.tickles: geom/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch geom/.that.tickles


geom/geom-syllabus.pdf: \
  geom/fvl/syllabus.fvl \
  geom/.that.tickles
	@mkdir -p geom/tex
	$(call copy,geom,nsulogo.png)
	$(call document,geom,syllabus)
	@rm -rf geom/tex


geom/geom-a%.pdf: \
  geom/fvl/a%.fvl \
  geom/.that.tickles
	@mkdir -p geom/tex
	$(call document,geom,a$*)
	@rm -rf geom/tex








ring: \
  ring-title \
  ring/ring-syllabus.pdf \
  $(patsubst ring/fvl/h%.fvl,ring/ring-h%.pdf,$(wildcard ring/fvl/h*.fvl)) \
  $(patsubst ring/fvl/t%.fvl,ring/ring-t%.pdf,$(wildcard ring/fvl/t*.fvl)) \
  $(patsubst ring/fvl/s%.fvl,ring/ring-s%.pdf,$(wildcard ring/fvl/s*.fvl))


ring-title: FORCE
	@echo ' ______    ___   __    _  _______ ' | doppler green
	@echo '|    _ |  |   | |  |  | ||       |' | doppler green
	@echo '|   | ||  |   | |   |_| ||    ___|' | doppler green
	@echo '|   |_||_ |   | |       ||   | __ ' | doppler green
	@echo '|    __  ||   | |  _    ||   ||  |' | doppler green
	@echo '|   |  | ||   | | | |   ||   |_| |' | doppler green
	@echo '|___|  |_||___| |_|  |__||_______|' | doppler green


ring/.that.tickles: ring/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch ring/.that.tickles


ring/ring-syllabus.pdf: \
  ring/fvl/syllabus.fvl \
  ring/.that.tickles
	@mkdir -p ring/tex
	$(call copy,ring,nsulogo.png)
	$(call document,ring,syllabus)
	@rm -rf ring/tex


ring/ring-s%.pdf: \
  ring/fvl/s%.fvl \
  ring/.that.tickles
	@mkdir -p ring/tex
	$(call slides,ring,s$*)
	@rm -rf ring/tex


ring/ring-h%.pdf: \
  ring/fvl/h%.fvl \
  ring/.that.tickles
	@mkdir -p ring/tex
	$(call document,ring,h$*)
	@rm -rf ring/tex


ring/ring-t%.pdf: \
  ring/fvl/t%.fvl \
  ring/.that.tickles
	@mkdir -p ring/tex
	$(call document,ring,t$*)
	@rm -rf ring/tex








ssem: \
  ssem-title


ssem-title: FORCE
	@echo ' _______  _______  _______  __   __ ' | doppler green
	@echo '|       ||       ||       ||  |_|  |' | doppler green
	@echo '|  _____||  _____||    ___||       |' | doppler green
	@echo '| |_____ | |_____ |   |___ |       |' | doppler green
	@echo '|_____  ||_____  ||    ___||       |' | doppler green
	@echo ' _____| | _____| ||   |___ | ||_|| |' | doppler green
	@echo '|_______||_______||_______||_|   |_|' | doppler green


ssem/.that.tickles: ssem/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch ssem/.that.tickles








define plaintex
  @echo "building $(1)/$(2)/$(3)" | doppler lightblue

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex > /dev/null
  @mv $(3).pdf $(1)/$(1)-$(3).pdf

  @echo '  clean up' | doppler lightcyan
  @rm -- $(3).aux $(3).log

  @echo '  built' | doppler lightgreen
endef



define document
  @echo "building $(1)/fvl/$(2)" | doppler lightblue

  @echo '  instantiate template' | doppler lightcyan
  @feivel -t $(1)/fvl/$(2).fvl \
   | tee error \
   > $(1)/tex/$(2).tex

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/tex/$(2).tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/$(2).tex > /dev/null
  @mv $(2).pdf $(1)/$(1)-$(2).pdf

  @echo '  clean up' | doppler lightcyan
  @rm -- $(2).aux $(2).log
  @rm -f error

  @echo '  built' | doppler lightgreen
endef



define solution
  @echo "building $(1)/fvl/soln-$(2)" | doppler lightblue

  @echo '  instantiate template' | doppler lightcyan
  @cat $(1)/fvl/$(2).fvl \
   | sed 's/@SHOWSOLN := #f/@SHOWSOLN := #t/' \
   | feivel \
   | tee error \
   > $(1)/tex/soln-$(2).tex

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/tex/soln-$(2).tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/soln-$(2).tex > /dev/null
  @mv soln-$(2).pdf $(1)/$(1)-soln-$(2).pdf

  @echo '  clean up' | doppler lightcyan
  @rm -- soln-$(2).aux soln-$(2).log
  @rm -f error

  @echo '  built' | doppler lightgreen
endef



define slides
  @echo "building $(1)/fvl/$(2)" | doppler lightblue

  @echo '  instantiate template' | doppler lightcyan
  @feivel -t $(1)/fvl/$(2).fvl \
   | tee error \
   > $(1)/tex/$(2).tex

  @echo '  split versions' | doppler lightcyan
  @cat $(1)/tex/$(2).tex \
    | sed s/class\{beamer\}/class\[handout\]\{beamer\}/ \
    | sed s/colortheme\{default\}/colortheme\{dove\}/ \
    > $(1)/tex/$(2)-print.tex

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex > /dev/null
  @mv $(2)-print.pdf $(1)/$(1)-print-$(2).pdf

  @pdflatex -interaction=batchmode $(1)/tex/$(2).tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/$(2).tex > /dev/null
  @mv $(2).pdf $(1)/$(1)-$(2).pdf

  @echo '  clean up' | doppler lightcyan
  @rm -- $(2)-print.aux $(2)-print.log
  @rm -- $(2)-print.nav $(2)-print.out $(2)-print.snm $(2)-print.toc

  @rm -- $(2).aux $(2).log
  @rm -- $(2).nav $(2).out $(2).snm $(2).toc
  @rm -- error

  @echo '  built' | doppler lightgreen
endef



define copy
  @echo "copying $(1)/fvl/$(2)" | doppler lightmagenta
  @cp -r $(1)/fvl/$(2) $(1)/tex/$(2)
endef
