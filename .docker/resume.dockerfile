FROM pandoc/latex:2.9

RUN apk add make

COPY actions/entrypoint.sh /entrypoint.sh
