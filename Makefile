RESUME=resume

<<<<<<< HEAD
all_and_short: all short
# all: html pdf docx rtf short
all: html


short:
	sh build_short_resume.sh
	$(MAKE) all RESUME=short_resume


pdf: $(RESUME).pdf
$(RESUME).pdf: style_chmduquesne.tex $(RESUME).md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o $(RESUME).tex $(RESUME).md; \
	context $(RESUME).tex

html: $(RESUME).html
$(RESUME).html: style_chmduquesne.css $(RESUME).md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o $(RESUME).html $(RESUME).md

docx: $(RESUME).docx
$(RESUME).docx: $(RESUME).md
	pandoc -s -S $(RESUME).md -o $(RESUME).docx

rtf: $(RESUME).rtf
$(RESUME).rtf: $(RESUME).md
	pandoc -s -S $(RESUME).md -o $(RESUME).rtf

clean:
	$(MAKE) clean_resume
	$(MAKE) clean_resume RESUME=short_resume
clean_resume:
	rm -f $(RESUME).html
	rm -f $(RESUME).tex
	rm -f $(RESUME).tuc
	rm -f $(RESUME).log
	rm -f $(RESUME).pdf
	rm -f $(RESUME).docx
	rm -f $(RESUME).rtf
