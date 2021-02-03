SHELL := /bin/bash

OUT_DIR=output
IN_DIR=markdown
STYLES_DIR=templates
STYLE=chmduquesne

all: context docx html pdf rtf

context: resume.tex
resume.tex: resume.md
	pandoc --standalone --template $(STYLES_DIR)/$(STYLE).tex \
	--from markdown --to context \
	-V papersize=letter \
	-o $(OUT_DIR)/resume.tex resume.md

pdf: context resume.pdf
resume.pdf:
	pushd $(OUT_DIR); \
	context resume.tex; \
	popd

html: resume.html
resume.html: $(STYLES_DIR)/template.html5 $(STYLES_DIR)/$(STYLE).css resume.md
	pandoc --standalone -H $(STYLES_DIR)/$(STYLE).css \
        --from markdown --to html5 --template $(STYLES_DIR)/template.html5 \
        -o $(OUT_DIR)/resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o $(OUT_DIR)/resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o $(OUT_DIR)/resume.rtf

clean:
	rm -f $(OUT_DIR)/resume.docx
	rm -f $(OUT_DIR)/resume.html
	rm -f $(OUT_DIR)/resume.pdf
	rm -f $(OUT_DIR)/resume.rtf
	rm -f $(OUT_DIR)/resume.tex
	rm -f $(OUT_DIR)/resume.tuc
	rm -f $(OUT_DIR)/resume.log
