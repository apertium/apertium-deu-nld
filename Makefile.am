###############################################################################
## Makefile for German--Dutch
###############################################################################

VERSION=0.1.0
LANG1=deu
LANG2=nld
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON = 		\
	$(PREFIX1).automorf.bin \
	$(PREFIX1).autobil.bin \
	$(PREFIX1).autogen.bin \
    $(PREFIX1).autopgen.bin \
	$(PREFIX2).automorf.bin \
	$(PREFIX2).autobil.bin \
    $(PREFIX2).autogen.bin \
	$(PREFIX2).autopgen.bin \
    $(PREFIX1).autolex.bin \
	$(PREFIX1).rlx.bin \
    $(PREFIX2).autolex.bin \
	$(PREFIX2).rlx.bin \
    $(PREFIX1).t1x.bin \
	$(PREFIX1).t2x.bin \
	$(PREFIX1).t3x.bin \
    $(PREFIX2).t1x.bin \
	$(PREFIX2).t2x.bin \
	$(PREFIX2).t3x.bin \
    $(PREFIX1).prob \
	$(PREFIX2).prob

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Transducers, disambiguation rules, transfer
###############################################################################

#$(PREFIX1).automorf.bin: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).dix $(AP_SRC1)/apertium-$(LANG1).$(LANG1).acx
#	apertium-validate-acx $(AP_SRC1)/apertium-$(LANG1).$(LANG1).acx
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@ $(AP_SRC1)/apertium-$(LANG1).$(LANG1).acx
#
$(PREFIX1).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1).autobil.bin
	lt-trim $^ $@

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp lr $(BASENAME).$(PREFIX1).dix $@

$(PREFIX1).autogen.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

#$(PREFIX1).autopgen.bin: $(AP_SRC2)/apertium-$(LANG2).post-$(LANG2).dix
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@

#$(PREFIX2).automorf.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).dix $(AP_SRC2)/apertium-$(LANG2).$(LANG2).acx
#	apertium-validate-acx $(AP_SRC2)/apertium-$(LANG2).$(LANG2).acx
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@ $(AP_SRC2)/apertium-$(LANG2).$(LANG2).acx
#
$(PREFIX2).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2).autobil.bin
	lt-trim $^ $@

$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFIX2).autogen.bin: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

#$(PREFIX2).autopgen.bin: $(AP_SRC1)/apertium-$(LANG1).post-$(LANG1).dix
#	apertium-validate-dictionary $<
#	lt-comp lr $< $@

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX2).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t1x $@

$(PREFIX2).t2x.bin: $(BASENAME).$(PREFIX2).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX2).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t2x $@

$(PREFIX2).t3x.bin: $(BASENAME).$(PREFIX2).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX2).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t3x $@

$(PREFIX1).rlx.bin: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).rlx
	cg-comp $< $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).rlx
	cg-comp $< $@

$(PREFIX1).autolex.bin: $(BASENAME).$(PREFIX1).lrx
	lrx-comp $(BASENAME).$(PREFIX1).lrx $@

$(PREFIX2).autolex.bin: $(BASENAME).$(PREFIX2).lrx
	lrx-comp $(BASENAME).$(PREFIX2).lrx $@


###############################################################################
## Tagger models
###############################################################################

$(PREFIX1).prob: $(AP_SRC1)/$(LANG1).prob
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@

###############################################################################
## Postgeneration dictionaries
###############################################################################

$(PREFIX1).autopgen.bin: $(AP_SRC2)/$(LANG2).autopgen.bin
	cp $< $@

$(PREFIX2).autopgen.bin: $(AP_SRC1)/$(LANG1).autopgen.bin
	cp $< $@

###############################################################################
## Distribution
###############################################################################

EXTRA_DIST=						\
		$(BASENAME).$(PREFIX1).dix \
		$(BASENAME).$(PREFIX1).lrx \
		$(BASENAME).$(PREFIX2).lrx \
		$(BASENAME).$(PREFIX1).t1x \
		$(BASENAME).$(PREFIX1).t2x \
		$(BASENAME).$(PREFIX1).t3x \
		$(BASENAME).$(PREFIX2).t1x \
		$(BASENAME).$(PREFIX2).t2x \
		$(BASENAME).$(PREFIX2).t3x \
		modes.xml

###############################################################################
## Installation
###############################################################################

apertium_deu_nlddir=$(prefix)/share/apertium/$(BASENAME)/

apertium_deu_nld_DATA=$(TARGETS_COMMON) \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX2).t1x \
	$(BASENAME).$(PREFIX2).t2x \
	$(BASENAME).$(PREFIX2).t3x

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

install-data-local: install-modes


###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local: 
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	echo "Dit markt is heel goed" | apertium -d . nld-deu | tee .test-mt
	@echo "Dieser Markt ist sehr gut" > .test-ref
	@diff .test-ref .test-mt
	@rm .test-ref .test-mt
