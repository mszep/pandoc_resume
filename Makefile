OUT=output/
IN=markdown/
STYLES=styles/
STYLE=chmduquesne
FILE=resume

all: dir html pdf docx rtf

pdf: $(FILE).pdf
$(FILE).pdf: dir $(STYLES)$(STYLE).tex $(IN)$(FILE).md
	pandoc --standalone --template $(STYLES)$(STYLE).tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o $(OUT)$(FILE).tex $(IN)$(FILE).md > /dev/null; \
	context $(OUT)$(FILE).tex --result=$(OUT)$(FILE).pdf > $(OUT)/context_$(FILE).log 2>&1;

html: $(FILE).html
$(FILE).html: dir $(STYLES)$(STYLE).css $(IN)$(FILE).md
	pandoc --standalone -H $(STYLES)$(STYLE).css \
	--from markdown --to html \
	-o $(OUT)$(FILE).html $(IN)$(FILE).md

docx: $(FILE).docx
$(FILE).docx: dir $(IN)$(FILE).md
	pandoc -s -S $(IN)$(FILE).md -o $(OUT)$(FILE).docx

rtf: $(FILE).rtf
$(FILE).rtf: dir $(IN)$(FILE).md
	pandoc -s -S $(IN)$(FILE).md -o $(OUT)$(FILE).rtf

dir: $(OUT)

$(OUT):
	mkdir -p $(OUT)

clean:
	rm -f $(OUT)*
