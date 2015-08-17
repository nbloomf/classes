# Process feivel template at $(1)/fvl/$(2)/$(3).fvl
define process
  feivel -t $(1)/fvl/$(2)/$(3).fvl \
   | tee error \
   > $(1)/tex/$(2)/$(3).tex
endef

# Render tex file at $(1)/tex/$(2)/$(3).tex
define render
  pdflatex $(1)/tex/$(2)/$(3).tex
  pdflatex $(1)/tex/$(2)/$(3).tex
  mv $(3).pdf $(1)
endef

define copy
  cp $(1)/fvl/$(2)/$(3) $(1)/tex/$(2)/$(3)
endef


cleantex1 = rm $(1).aux $(1).log
cleantex2 = rm $(1).nav $(1).out $(1).snm $(1).toc

all: abstract geom ca

abstract: FORCE
	# Syllabus
	$(call process,abstract,syllabus,syllabus)
	$(call copy,abstract,syllabus,nsulogo.png)
	$(call render,abstract,syllabus,syllabus)
	$(call cleantex1,syllabus)

	# Slides
	$(call process,abstract,slides,zz-axioms)
	$(call render,abstract,slides,zz-axioms)
	$(call cleantex1,zz-axioms)
	$(call cleantex2,zz-axioms)

	rm error

geom: FORCE
	# Syllabus
	$(call process,geom,syllabus,syllabus)
	$(call copy,geom,syllabus,nsulogo.png)
	$(call render,geom,syllabus,syllabus)
	$(call cleantex1,syllabus)
	rm error

ca: FORCE
	# Syllabus
	$(call process,ca,syllabus,syllabus09)
	$(call process,ca,syllabus,syllabus10)
	$(call copy,ca,syllabus,nsulogo.png)
	$(call render,ca,syllabus,syllabus09)
	$(call render,ca,syllabus,syllabus10)
	$(call cleantex1,syllabus09)
	$(call cleantex1,syllabus10)

	$(call process,ca,review,r0-prereq)
	$(call render,ca,review,r0-prereq)
	$(call cleantex1,r0-prereq)
	rm error

FORCE:
