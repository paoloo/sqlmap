FROM alpine:3.10

MAINTAINER Paolo Oliveira <paolo@fisica.ufc.br>

RUN apk add --update python
RUN apk add --update git
RUN git clone https://github.com/sqlmapproject/sqlmap.git

WORKDIR /sqlmap

ENTRYPOINT ["python", "sqlmap.py"]
