all: all_en all_fr
clean_all: clean_en clean_fr

# EN
all_en: html_en pdf_en docx_en rtf_en

pdf_en: resume_en.pdf
resume_en.pdf: resume_en.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume_en.tex resume_en.md; \
	context resume_en.tex

html_en: resume_en.html
resume_en.html: style_chmduquesne.css resume_en.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume_en.html resume_en.md

docx_en: resume_en.docx
resume_en.docx: resume_en.md
	pandoc -s -S resume_en.md -o resume_en.docx

rtf_en: resume_en.rtf
resume_en.rtf: resume_en.md
	pandoc -s -S resume_en.md -o resume_en.rtf

clean_en:
	rm -f resume_en.html
	rm -f resume_en.tex
	rm -f resume_en.tuc
	rm -f resume_en.log
	rm -f resume_en.pdf
	rm -f resume_en.docx
	rm -f resume_en.rtf

# FR
all_fr: html_fr pdf_fr docx_fr rtf_fr

pdf_fr: resume_fr.pdf
resume_fr.pdf: resume_fr.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume_fr.tex resume_fr.md; \
	context resume_fr.tex

html_fr: resume_fr.html
resume_fr.html: style_chmduquesne_fr.css resume_fr.md
	pandoc --standalone -H style_chmduquesne_fr.css \
        --from markdown --to html \
        -o resume_fr.html resume_fr.md

docx_fr: resume_fr.docx
resume_fr.docx: resume_fr.md
	pandoc -s -S resume_fr.md -o resume_fr.docx

rtf_fr: resume_fr.rtf
resume_fr.rtf: resume_fr.md
	pandoc -s -S resume_fr.md -o resume_fr.rtf

clean_fr:
	rm -f resume_fr.html
	rm -f resume_fr.tex
	rm -f resume_fr.tuc
	rm -f resume_fr.log
	rm -f resume_fr.pdf
	rm -f resume_fr.docx
	rm -f resume_fr.rtf
