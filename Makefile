# Surviving the AI World — build pipeline
# Targets: pdf, epub, clean, all
#
# Inputs:  manuscript/**/*.md (chapters discovered via find, sorted by path)
# Outputs: dist/surviving-the-ai-world.{pdf,epub}
#
# Requires: pandoc, xelatex (texlive-xetex), make.

PANDOC      ?= pandoc
PDF_ENGINE  ?= xelatex
BUILD_DIR   := build
DIST_DIR    := dist
DEFAULTS    := $(BUILD_DIR)/defaults.yaml
TITLE       := surviving-the-ai-world

# Sort by path so Part 1 → Part 5 and ch-01 → ch-06 stay in order.
SOURCES := $(shell find manuscript -name 'chapter.md' | sort)

PDF_OUT  := $(DIST_DIR)/$(TITLE).pdf
EPUB_OUT := $(DIST_DIR)/$(TITLE).epub

.PHONY: all pdf epub clean

all: pdf epub

pdf: $(PDF_OUT)

epub: $(EPUB_OUT)

$(PDF_OUT): $(SOURCES) $(DEFAULTS) | $(DIST_DIR)
	$(PANDOC) --defaults=$(DEFAULTS) --pdf-engine=$(PDF_ENGINE) -o $@ $(SOURCES)

$(EPUB_OUT): $(SOURCES) $(DEFAULTS) | $(DIST_DIR)
	$(PANDOC) --defaults=$(DEFAULTS) -o $@ $(SOURCES)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

clean:
	rm -f $(PDF_OUT) $(EPUB_OUT)
	rm -f *.aux *.log *.toc *.out
