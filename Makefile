all: html pdf

pdf: resume.md
	pandoc --standalone --template style_green.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

html: style_green.css resume.md
	pandoc --standalone -H style_green.css \
        --from markdown --to html \
        -o resume.html resume.md

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
