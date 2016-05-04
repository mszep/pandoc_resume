SHELL := /bin/bash
all: context docx html pdf rtf

context: resume.tex
resume.tex: resume.md
	pandoc --standalone --template templates/style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=letter \
	-o output/resume.tex resume.md

pdf: resume.pdf
resume.pdf:
	pushd output; \
	context resume.tex; \
	popd

html: resume.html
resume.html: templates/template.html5 templates/style_chmduquesne.css resume.md
	pandoc --standalone -H templates/style_chmduquesne.css \
        --from markdown --to html5 --template templates/template.html5 \
        -o output/resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o output/resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o output/resume.rtf

clean:
	rm output/resume.docx
	rm output/resume.html
	rm output/resume.pdf
	rm output/resume.rtf
	rm output/resume.tex
	rm output/resume.tuc
	rm output/resume.log
