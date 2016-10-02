FROM alpine:3.1

MAINTAINER Paolo Oliveira <paolo@fisica.ufc.br>

RUN apk add --update python &&\
    apk add --update git &&\
    git clone https://github.com/sqlmapproject/sqlmap.git

WORKDIR /sqlmap

ENTRYPOINT ["python", "sqlmap.py"]
