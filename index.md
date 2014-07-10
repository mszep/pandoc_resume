# The Markdown Resume

Christophe-Marie Duquesne has a great [blog post][chmd] wherein he
shows that using [pandoc][pandoc], you can maintain your resume in
markdown format and convert to other formats such as html and Word
at will. However, the recommendation for obtaining a pdf is to use
the [wkhtmltopdf tool][wkhtmltopdf], which takes the pandoc-generated
HTML and uses the webkit browser engine to generate a pdf.

Unfortunately, webkit is not a typesetting engine, so the pdf output
is suboptimal; most importantly, it does not handle page breaks well,
in some cases even putting a page break right across a line of text.

TeX-based typesetting systems are designed for this task however, and
fortunately pandoc supports two types of TeX output: LaTeX and
[ConTeXt][context]. I chose the latter since it seemed interesting, is
more focused on page layout, and is not specialized for scientific
documents. Using a style.tex which emulates Christophe-Marie's
style.css, we can create a nicely typeset pdf document which looks
quite similar to the HTML:

[HTML version](resume.html) of the resume:

<iframe src="resume.html" width=100% height=500px></iframe>

[PDF version](resume.pdf) of the resume:

<object data="resume.pdf" type="application/pdf" width=100% height=500px></object>

The repository is [here][repo] (pull requests welcome), so you can
clone it, insert your own resume.md, and have your own sweet pdf
resume in no time!

[chmd]: http://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html
[pandoc]: http://johnmacfarlane.net/pandoc/
[wkhtmltopdf]: http://wkhtmltopdf.org/
[context]: http://wiki.contextgarden.net/
[repo]: https://github.com/mszep/pandoc_resume
