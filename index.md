% The Markdown Resume

Maintaining a resume is one of those annoying tasks that always takes
up much more of your time than it should. Compounding this is the fact
that resumes can be requested in different formats: raw text, pdf,
Microsoft Word, etc. In addition, it might be desirable to have a HTML
version online somewhere for added visibility. How then to manage this
complexity? No one wants to manually update four versions of their
resume, and the pdf conversion tools included with word processors
leave much to be desired.

Christophe-Marie Duquesne has a great [blog post][chmd] wherein he
shows that using the document translation tool [pandoc][pandoc], you
can maintain your resume in [markdown format][markdown] and convert
to other formats such as html and Word at will.

This is convenient because:

 * It means there is only one file you need to update to make any
   changes.
 * Markdown is designed to be human-readable, so if you need a raw text
   version of your resume, no transformation is needed.
 * Markdown has syntax for section headers, lists, tables and more, so
   you can add as much structure as you want to your resume.
 * Being a format designed (partly) for human consumption and creation,
   it is also an appropriate format to keep in version control.

This is what a simple resume in markdown format looks like:

<script src="https://gist.github.com/mszep/d3235240cc6653d6eeaa.js"></script>

However, in the above approach the generation of a pdf version
(arguably the most important) is problematic. The suggestion is to use
the [wkhtmltopdf tool][wkhtmltopdf], which takes the pandoc-generated
HTML and uses the webkit browser engine to generate a pdf. This will
preserve the look and feel of the resume, but unfortunately, webkit is
not a typesetting engine, so the pdf output is suboptimal. Most
importantly, it does not handle page breaks well, in some cases even
putting a page break right across a line of text.

TeX-based typesetting systems are designed for this task however, and
fortunately pandoc supports two types of TeX output: LaTeX and
[ConTeXt][context]. I chose the latter since it seemed interesting, is
more focused on page layout, and is not specifically geared towards
scientific documents. Through trial and error, I was able to create a
style.tex which comes close to emulating Christophe-Marie's style.css,
resulting in a nicely typeset pdf resume which looks quite similar to
the HTML:

[HTML version](resume.html) of the resume:

<iframe src="resume.html" width=100% height=500px></iframe>

[PDF version](resume.pdf) of the resume:

<object data="resume.pdf" type="application/pdf" width=100% height=500px></object>

The repository is [here][repo] (pull requests welcome!), and it includes
a Makefile, so the instructions to make your own resume are:

    git clone https://github.com/mszep/pandoc_resume
    cd pandoc_resume
    vim resume.md   #insert your own resume info
    make

You will need both pandoc and ConTeXt installed on your system, which
on Debian and derivatives can be achieved with

    sudo apt-get install pandoc context

[chmd]: http://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html
[pandoc]: http://johnmacfarlane.net/pandoc/
[markdown]: http://daringfireball.net/projects/markdown/syntax
[wkhtmltopdf]: http://wkhtmltopdf.org/
[context]: http://wiki.contextgarden.net/
[repo]: https://github.com/mszep/pandoc_resume

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-52741296-1', 'auto');
  ga('send', 'pageview');

</script>
