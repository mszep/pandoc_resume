FROM pandoc/latex:2.9

RUN apk add make texlive

COPY actions/entrypoint.sh /entrypoint.sh
