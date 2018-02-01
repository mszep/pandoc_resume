OUT_DIR=output
IN_DIR=markdown
STYLES_DIR=styles
STYLE=chmduquesne

all: html pdf docx rtf

pdf: dir
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.pdf; \
		pandoc --standalone --template $(STYLES_DIR)/$(STYLE).tex \
			--from markdown --to context \
			-V papersize=A4 \
			-o $(OUT_DIR)/$$FILE_NAME.tex $$f > /dev/null; \
		context $(OUT_DIR)/$$FILE_NAME.tex --result=$(OUT_DIR)/$$FILE_NAME.pdf > $(OUT_DIR)/context_$$FILE_NAME.log 2>&1; \
	done

html: dir
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.html; \
		pandoc --standalone -H $(STYLES_DIR)/$(STYLE).css \
			--from markdown --to html \
			-o $(OUT_DIR)/$$FILE_NAME.html $$f; \
	done

docx: dir
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.docx; \
		pandoc -s -S $$f -o $(OUT_DIR)/$$FILE_NAME.docx; \
	done

rtf: dir
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.rtf; \
		pandoc -s -S $$f -o $(OUT_DIR)/$$FILE_NAME.rtf; \
	done

dir:
	mkdir -p $(OUT_DIR)

clean:
	rm -f $(OUT_DIR)/*
