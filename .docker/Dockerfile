FROM pandoc/latex:2.9

RUN apk add make texlive

ENV TEXMF /usr/share/texmf-dist

WORKDIR /home/app/resume

ENTRYPOINT ["make", "pdf", "html"]