targets: FORCE
	@echo 'TARGETS:'                                 | doppler lightblue
	@echo '  make coal  - College Algebra'           | doppler lightblue
	@echo '  make stat  - Statistics'                | doppler lightblue
	@echo '  make calc  - Calculus 1'                | doppler lightblue
	@echo '  make prfs  - Intro to Proof'            | doppler lightblue
	@echo '  make geom  - College Geometry'          | doppler lightblue
	@echo '  make ring  - Modern Algebra (Rings)'    | doppler lightblue
	@echo '  make ssem  - Senior Seminar'            | doppler lightblue
	@echo '  make all   - Everything'                | doppler lightblue
	@echo '  make clean - Delete generated files'    | doppler lightblue
	@echo
	@echo 'edit foo/tickle.me to force build foo'    | doppler lightblue
	@echo 'edit tickle.me to force build everything' | doppler lightblue

all: coal stat calc prfs geom ring ssem

clean: FORCE
	@(rm calc/pdf/* || true) 2> /dev/null
	@(rm coal/pdf/* || true) 2> /dev/null
	@(rm stat/pdf/* || true) 2> /dev/null
	@(rm prfs/pdf/* || true) 2> /dev/null
	@(rm geom/pdf/* || true) 2> /dev/null
	@(rm ring/pdf/* || true) 2> /dev/null
	@(rm ssem/pdf/* || true) 2> /dev/null




that.tickles: tickle.me
	@echo "That tickles!" | doppler lightred
	@touch that.tickles


coal: \
  coal/coal-syllabus.pdf \
  coal-activities \
  coal-reviews \
  coal-tests
	@echo ' _______  _______  _______  ___     ' | doppler green
	@echo '|       ||       ||   _   ||   |    ' | doppler green
	@echo '|       ||   _   ||  |_|  ||   |    ' | doppler green
	@echo '|       ||  | |  ||       ||   |    ' | doppler green
	@echo '|      _||  |_|  ||       ||   |___ ' | doppler green
	@echo '|     |_ |       ||   _   ||       |' | doppler green
	@echo '|_______||_______||__| |__||_______|' | doppler green


coal/that.tickles: coal/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch coal/that.tickles


coal/coal-syllabus.pdf: \
  coal/fvl/syllabus.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call copy,coal,nsulogo.png)
	$(call document,coal,syllabus)
	@rm -rf coal/tex



coal-activities: \
  coal/coal-a01-linear-ish-equations.pdf \
  coal/coal-a02-some-geometry.pdf \
  coal/coal-a03-compound-equations.pdf \
  coal/coal-a04-functions.pdf \
  coal/coal-a05-transformations.pdf \
  coal/coal-a06-polynomials.pdf \
  coal/coal-a07-polynomials-ii.pdf \
  coal/coal-a08-exponentials-and-logs.pdf



coal/coal-a01-linear-ish-equations.pdf: \
  coal/fvl/a01-linear-ish-equations.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a01-linear-ish-equations)
	$(call solution,coal,a01-linear-ish-equations)
	@rm -rf coal/tex

coal/coal-a02-some-geometry.pdf: \
  coal/fvl/a02-some-geometry.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a02-some-geometry)
	$(call solution,coal,a02-some-geometry)
	@rm -rf coal/tex

coal/coal-a03-compound-equations.pdf: \
  coal/fvl/a03-compound-equations.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a03-compound-equations)
	$(call solution,coal,a03-compound-equations)
	@rm -rf coal/tex

coal/coal-a04-functions.pdf: \
  coal/fvl/a04-functions.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a04-functions)
	$(call solution,coal,a04-functions)
	@rm -rf coal/tex

coal/coal-a05-transformations.pdf: \
  coal/fvl/a05-transformations.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a05-transformations)
	$(call solution,coal,a05-transformations)
	@rm -rf coal/tex

coal/coal-a06-polynomials.pdf: \
  coal/fvl/a06-polynomials.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a06-polynomials)
	@rm -rf coal/tex

coal/coal-a07-polynomials-ii.pdf: \
  coal/fvl/a07-polynomials-ii.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a07-polynomials-ii)
	@rm -rf coal/tex

coal/coal-a08-exponentials-and-logs.pdf: \
  coal/fvl/a08-exponentials-and-logs.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,a08-exponentials-and-logs)
	@rm -rf coal/tex



coal-reviews: \
  coal/coal-r1-equations-and-geometry.pdf \
  coal/coal-r2-functions.pdf \
  coal/coal-r3-polynomials.pdf \
  coal/coal-r4-exponentials-and-logs.pdf

coal/coal-r1-equations-and-geometry.pdf: \
  coal/fvl/r1-equations-and-geometry.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,r1-equations-and-geometry)
	$(call solution,coal,r1-equations-and-geometry)
	@rm -rf coal/tex

coal/coal-r2-functions.pdf: \
  coal/fvl/r2-functions.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,r2-functions)
	@rm -rf coal/tex

coal/coal-r3-polynomials.pdf: \
  coal/fvl/r3-polynomials.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,r3-polynomials)
	@rm -rf coal/tex

coal/coal-r4-exponentials-and-logs.pdf: \
  coal/fvl/r4-exponentials-and-logs.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,r4-exponentials-and-logs)
	@rm -rf coal/tex



coal-tests: \
  coal/coal-t1-equations-and-geometry.pdf \
  coal/coal-t2-functions.pdf \
  coal/coal-t3-polynomials.pdf \
  coal/coal-t4-exponentials-and-logs.pdf

coal/coal-t1-equations-and-geometry.pdf: \
  coal/fvl/t1-equations-and-geometry.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,t1-equations-and-geometry)
	$(call solution,coal,t1-equations-and-geometry)
	@rm -rf coal/tex

coal/coal-t2-functions.pdf: \
  coal/fvl/t2-functions.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,t2-functions)
	@rm -rf coal/tex

coal/coal-t3-polynomials.pdf: \
  coal/fvl/t3-polynomials.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,t3-polynomials)
	@rm -rf coal/tex

coal/coal-t4-exponentials-and-logs.pdf: \
  coal/fvl/t4-exponentials-and-logs.fvl \
  coal/that.tickles \
  that.tickles
	@mkdir -p coal/tex
	$(call document,coal,t4-exponentials-and-logs)
	@rm -rf coal/tex








stat: \
  stat/stat-syllabus.pdf \
  stat/stat-z-score-table.pdf \
  stat-activities \
  stat-tests \
  stat-slides
	@echo ' _______  _______  _______  _______ ' | doppler green
	@echo '|       ||       ||   _   ||       |' | doppler green
	@echo '|  _____||_     _||  |_|  ||_     _|' | doppler green
	@echo '| |_____   |   |  |       |  |   |  ' | doppler green
	@echo '|_____  |  |   |  |       |  |   |  ' | doppler green
	@echo ' _____| |  |   |  |   _   |  |   |  ' | doppler green
	@echo '|_______|  |___|  |__| |__|  |___|  ' | doppler green


stat/that.tickles: stat/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch stat/that.tickles

stat/stat-syllabus.pdf: \
  stat/fvl/syllabus.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex/gfx
	$(call copy,stat,gfx/nsulogo.png)
	$(call document,stat,syllabus)
	@rm -rf stat/tex

stat/stat-z-score-table.pdf: \
  stat/tables/z-score-table.tex \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call plaintex,stat,tables,z-score-table)
	@rm -rf stat/tex


stat-activities: \
  stat/stat-a01-basic-parameters.pdf \
  stat/stat-a02-probability.pdf \
  stat/stat-a03-counting.pdf \
  stat/stat-a04-discrete-random-variables.pdf \
  stat/stat-a05-discrete-random-variables-ii.pdf \
  stat/stat-a06-normal-random-variables.pdf \
  stat/stat-a07-sampling-distributions.pdf

stat/stat-a01-basic-parameters.pdf: \
  stat/fvl/a01-basic-parameters.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a01-basic-parameters)
	$(call solution,stat,a01-basic-parameters)
	@rm -rf stat/tex

stat/stat-a02-probability.pdf: \
  stat/fvl/a02-probability.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a02-probability)
	$(call solution,stat,a02-probability)
	@rm -rf stat/tex

stat/stat-a03-counting.pdf: \
  stat/fvl/a03-counting.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a03-counting)
	@rm -rf stat/tex

stat/stat-a04-discrete-random-variables.pdf: \
  stat/fvl/a04-discrete-random-variables.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a04-discrete-random-variables)
	@rm -rf stat/tex

stat/stat-a05-discrete-random-variables-ii.pdf: \
  stat/fvl/a05-discrete-random-variables-ii.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a05-discrete-random-variables-ii)
	@rm -rf stat/tex

stat/stat-a06-normal-random-variables.pdf: \
  stat/fvl/a06-normal-random-variables.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a06-normal-random-variables)
	@rm -rf stat/tex

stat/stat-a07-sampling-distributions.pdf: \
  stat/fvl/a07-sampling-distributions.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,a07-sampling-distributions)
	@rm -rf stat/tex



stat-tests: \
  stat/stat-t1-parameters-and-probability.pdf \
  stat/stat-t2-counting-and-drvs.pdf \
  stat/stat-t3-continuous-rvs.pdf

stat/stat-t1-parameters-and-probability.pdf: \
  stat/fvl/t1-parameters-and-probability.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,r1-parameters-and-probability)
	$(call solution,stat,r1-parameters-and-probability)
	$(call document,stat,t1-parameters-and-probability)
	@rm -rf stat/tex

stat/stat-t2-counting-and-drvs.pdf: \
  stat/fvl/t2-counting-and-drvs.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,r2-counting-and-drvs)
	$(call document,stat,t2-counting-and-drvs)
	@rm -rf stat/tex

stat/stat-t3-continuous-rvs.pdf: \
  stat/fvl/t3-continuous-rvs.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,r3-continuous-rvs)
	$(call document,stat,t3-continuous-rvs)
	@rm -rf stat/tex

stat/stat-t4-inference.pdf: \
  stat/fvl/t4-inference.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex
	$(call document,stat,t4-inference)
	@rm -rf stat/tex

stat-slides: \
  stat/stat-print-slides-misleading-graphs.pdf

stat/stat-print-slides-misleading-graphs.pdf: \
  stat/fvl/slides-misleading-graphs.fvl \
  stat/that.tickles \
  that.tickles
	@mkdir -p stat/tex/gfx
	$(call copy,stat,gfx/misleading-graphs/)
	$(call slides,stat,slides-misleading-graphs)
	@rm -rf stat/tex











calc: \
  calc/calc-syllabus.pdf \
  calc-activities \
  calc-reviews \
  calc-tests
	@echo ' _______  _______  ___      _______ ' | doppler green
	@echo '|       ||   _   ||   |    |       |' | doppler green
	@echo '|       ||  |_|  ||   |    |       |' | doppler green
	@echo '|       ||       ||   |    |       |' | doppler green
	@echo '|      _||       ||   |___ |      _|' | doppler green
	@echo '|     |_ |   _   ||       ||     |_ ' | doppler green
	@echo '|_______||__| |__||_______||_______|' | doppler green


calc/that.tickles: calc/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch calc/that.tickles



calc/calc-syllabus.pdf: \
  calc/fvl/syllabus.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call copy,calc,nsulogo.png)
	$(call document,calc,syllabus)
	@rm -rf calc/tex



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

calc/calc-a01-limits.pdf: \
  calc/fvl/a01-limits.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a01-limits)
	$(call solution,calc,a01-limits)
	@rm -rf calc/tex

calc/calc-a02-continuity.pdf: \
  calc/fvl/a02-continuity.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a02-continuity)
	$(call solution,calc,a02-continuity)
	@rm -rf calc/tex

calc/calc-a03-differentiation-1.pdf: \
  calc/fvl/a03-differentiation-1.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a03-differentiation-1)
	$(call solution,calc,a03-differentiation-1)
	@rm -rf calc/tex

calc/calc-a04-differentiation-2.pdf: \
  calc/fvl/a04-differentiation-2.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a04-differentiation-2)
	$(call solution,calc,a04-differentiation-2)
	@rm -rf calc/tex

calc/calc-a05-differentiation-3.pdf: \
  calc/fvl/a05-differentiation-3.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a05-differentiation-3)
	@rm -rf calc/tex

calc/calc-a06-monotonicity-and-concavity.pdf: \
  calc/fvl/a06-monotonicity-and-concavity.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a06-monotonicity-and-concavity)
	@rm -rf calc/tex

calc/calc-a07-extrema.pdf: \
  calc/fvl/a07-extrema.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a07-extrema)
	@rm -rf calc/tex

calc/calc-a08-applications.pdf: \
  calc/fvl/a08-applications.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a08-applications)
	@rm -rf calc/tex

calc/calc-a09-integration.pdf: \
  calc/fvl/a09-integration.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,a09-integration)
	@rm -rf calc/tex



calc-reviews: \
  calc/calc-r1-limits-and-derivatives.pdf \
  calc/calc-r2-differentiation.pdf

calc/calc-r1-limits-and-derivatives.pdf: \
  calc/fvl/r1-limits-and-derivatives.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,r1-limits-and-derivatives)
	$(call solution,calc,r1-limits-and-derivatives)
	@rm -rf calc/tex

calc/calc-r2-differentiation.pdf: \
  calc/fvl/r2-differentiation.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,r2-differentiation)
	@rm -rf calc/tex



calc-tests: \
  calc/calc-t1-limits-and-derivatives.pdf \
  calc/calc-t2-differentiation.pdf \
  calc/calc-t3-differentiation-ii.pdf \
  calc/calc-t4-integration.pdf

calc/calc-t1-limits-and-derivatives.pdf: \
  calc/fvl/t1-limits-and-derivatives.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,t1-limits-and-derivatives)
	@rm -rf calc/tex

calc/calc-t2-differentiation.pdf: \
  calc/fvl/t2-differentiation.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,t2-differentiation)
	@rm -rf calc/tex

calc/calc-t3-differentiation-ii.pdf: \
  calc/fvl/t3-differentiation-ii.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,t3-differentiation-ii)
	@rm -rf calc/tex

calc/calc-t4-integration.pdf: \
  calc/fvl/t4-integration.fvl \
  calc/that.tickles \
  that.tickles
	@mkdir -p calc/tex
	$(call document,calc,t4-integration)
	@rm -rf calc/tex








prfs: \
  prfs/prfs-syllabus.pdf \
  prfs-homework \
  prfs-tests
	@echo ' _______  ______    _______  _______ ' | doppler green
	@echo '|       ||    _ |  |       ||       |' | doppler green
	@echo '|    _  ||   | ||  |    ___||  _____|' | doppler green
	@echo '|   |_| ||   |_||_ |   |___ | |_____ ' | doppler green
	@echo '|    ___||    __  ||    ___||_____  |' | doppler green
	@echo '|   |    |   |  | ||   |     _____| |' | doppler green
	@echo '|___|    |___|  |_||___|    |_______|' | doppler green


prfs/that.tickles: prfs/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch prfs/that.tickles



prfs/prfs-syllabus.pdf: \
  prfs/fvl/syllabus.fvl \
  prfs/that.tickles \
  that.tickles
	@mkdir -p prfs/tex/gfx
	$(call copy,prfs,gfx/nsulogo.png)
	$(call document,prfs,syllabus)
	@rm -rf prfs/tex

prfs-homework: \
  prfs/prfs-h01-statements-and-quantifiers.pdf \
  prfs/prfs-h02-union-and-intersection.pdf

prfs/prfs-h01-statements-and-quantifiers.pdf: \
  prfs/fvl/h01-statements-and-quantifiers.fvl \
  prfs/that.tickles \
  that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,h01-statements-and-quantifiers)
	@rm -rf prfs/tex

prfs/prfs-h02-union-and-intersection.pdf: \
  prfs/fvl/h02-union-and-intersection.fvl \
  prfs/that.tickles \
  that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,h02-union-and-intersection)
	@rm -rf prfs/tex

prfs-tests: \
  prfs/prfs-t1-sets.pdf \
  prfs/prfs-t2-numbers.pdf

prfs/prfs-t1-sets.pdf: \
  prfs/fvl/t1-sets.fvl \
  prfs/that.tickles \
  that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,t1-sets)
	@rm -rf prfs/tex

prfs/prfs-t2-numbers.pdf: \
  prfs/fvl/t2-numbers.fvl \
  prfs/that.tickles \
  that.tickles
	@mkdir -p prfs/tex
	$(call document,prfs,t2-numbers)
	@rm -rf prfs/tex










geom: \
  geom/geom-syllabus.pdf \
  geom-activities
	@echo ' _______  _______  _______  __   __ ' | doppler green
	@echo '|       ||       ||       ||  |_|  |' | doppler green
	@echo '|    ___||    ___||   _   ||       |' | doppler green
	@echo '|   | __ |   |___ |  | |  ||       |' | doppler green
	@echo '|   ||  ||    ___||  |_|  ||       |' | doppler green
	@echo '|   |_| ||   |___ |       || ||_|| |' | doppler green
	@echo '|_______||_______||_______||_|   |_|' | doppler green


geom/that.tickles: geom/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch geom/that.tickles

geom/geom-syllabus.pdf: \
  geom/fvl/syllabus.fvl \
  geom/that.tickles \
  that.tickles
	@mkdir -p geom/tex
	$(call copy,geom,nsulogo.png)
	$(call document,geom,syllabus)
	@rm -rf geom/tex

geom-activities: \
  geom/geom-a1-basic-constructions.pdf \
  geom/geom-a2-hyperbolic-constructions.pdf \
  geom/geom-a3-symmetries-of-the-square.pdf

geom/geom-a1-basic-constructions.pdf: \
  geom/fvl/a1-basic-constructions.fvl \
  geom/that.tickles \
  that.tickles
	@mkdir -p geom/tex
	$(call document,geom,a1-basic-constructions)
	@rm -rf geom/tex

geom/geom-a2-hyperbolic-constructions.pdf: \
  geom/fvl/a2-hyperbolic-constructions.fvl \
  geom/that.tickles \
  that.tickles
	@mkdir -p geom/tex
	$(call document,geom,a2-hyperbolic-constructions)
	@rm -rf geom/tex

geom/geom-a3-symmetries-of-the-square.pdf: \
  geom/fvl/a3-symmetries-of-the-square.fvl \
  geom/that.tickles \
  that.tickles
	@mkdir -p geom/tex
	$(call document,geom,a3-symmetries-of-the-square)
	@rm -rf geom/tex








ring: \
  ring/ring-syllabus.pdf \
  ring-slides \
  ring-homework \
  ring-tests
	@echo ' ______    ___   __    _  _______ ' | doppler green
	@echo '|    _ |  |   | |  |  | ||       |' | doppler green
	@echo '|   | ||  |   | |   |_| ||    ___|' | doppler green
	@echo '|   |_||_ |   | |       ||   | __ ' | doppler green
	@echo '|    __  ||   | |  _    ||   ||  |' | doppler green
	@echo '|   |  | ||   | | | |   ||   |_| |' | doppler green
	@echo '|___|  |_||___| |_|  |__||_______|' | doppler green


ring/that.tickles: ring/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch ring/that.tickles

ring/ring-syllabus.pdf: \
  ring/fvl/syllabus.fvl \
  ring/that.tickles \
  that.tickles
	@mkdir -p ring/tex
	$(call copy,ring,nsulogo.png)
	$(call document,ring,syllabus)
	@rm -rf ring/tex


ring-slides: \
  ring/ring-screen-slides-zz-axioms.pdf


ring/ring-screen-slides-zz-axioms.pdf: \
  ring/fvl/slides-zz-axioms.fvl \
  ring/that.tickles \
  that.tickles
	@mkdir -p ring/tex
	$(call slides,ring,slides-zz-axioms)
	@rm -rf ring/tex

ring-homework: \
  ring/ring-hw2.pdf

ring/ring-hw2.pdf: \
  ring/fvl/hw2.fvl \
  ring/that.tickles \
  that.tickles
	@mkdir -p ring/tex
	$(call document,ring,hw2)
	@rm -rf ring/tex

ring-tests: \
  ring/ring-final.pdf

ring/ring-final.pdf: \
  ring/fvl/final.fvl \
  ring/that.tickles \
  that.tickles
	@mkdir -p ring/tex
	$(call document,ring,final)
	@rm -rf ring/tex








ssem: FORCE
	@echo ' _______  _______  _______  __   __ ' | doppler green
	@echo '|       ||       ||       ||  |_|  |' | doppler green
	@echo '|  _____||  _____||    ___||       |' | doppler green
	@echo '| |_____ | |_____ |   |___ |       |' | doppler green
	@echo '|_____  ||_____  ||    ___||       |' | doppler green
	@echo ' _____| | _____| ||   |___ | ||_|| |' | doppler green
	@echo '|_______||_______||_______||_|   |_|' | doppler green

ssem/that.tickles: ssem/tickle.me
	@echo "That tickles!" | doppler lightred
	@touch ssem/that.tickles


FORCE:



define plaintex
  @echo "building $(1)/$(2)/$(3)" | doppler lightblue

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/$(2)/$(3).tex > /dev/null
  @mv $(3).pdf $(1)/$(1)-$(3).pdf

  @echo '  clean up' | doppler lightcyan
  @rm $(3).aux $(3).log

  @echo "built $(1)/$(2)/$(3)" | doppler lightgreen
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

  @echo '  Clean up' | doppler lightcyan
  @rm $(2).aux $(2).log
  @rm -f error

  @echo "built $(1)/fvl/$(2)" | doppler lightgreen
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
  @rm soln-$(2).aux soln-$(2).log
  @rm -f error

  @echo "built $(1)/fvl/soln-$(2)" | doppler lightgreen
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
  @mv $(1)/tex/$(2).tex $(1)/tex/$(2)-screen.tex

  @echo '  generate pdfs' | doppler lightcyan
  @pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/$(2)-print.tex > /dev/null
  @mv $(2)-print.pdf $(1)/$(1)-print-$(2).pdf

  @pdflatex -interaction=batchmode $(1)/tex/$(2)-screen.tex > /dev/null
  @pdflatex -interaction=batchmode $(1)/tex/$(2)-screen.tex > /dev/null
  @mv $(2)-screen.pdf $(1)/$(1)-screen-$(2).pdf

  @echo '  clean up' | doppler lightcyan
  @rm -- $(2)-print.aux $(2)-print.log
  @rm -- $(2)-print.nav $(2)-print.out $(2)-print.snm $(2)-print.toc

  @rm -- $(2)-screen.aux $(2)-screen.log
  @rm -- $(2)-screen.nav $(2)-screen.out $(2)-screen.snm $(2)-screen.toc
  @rm error

  @echo "built $(1)/fvl/$(2)" | doppler lightgreen
endef



define copy
  @echo "copying $(1)/fvl/$(2)" | doppler lightmagenta
  @cp -r $(1)/fvl/$(2) $(1)/tex/$(2)
endef
