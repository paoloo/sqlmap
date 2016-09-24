#!/bin/bash

# clone the last version of sqlmap repo
git clone https://github.com/sqlmapproject/sqlmap.git

# remove .git as it is big and unuseful in a immutable archtecture
rm -rf ./sqlmap/.git/

# create Dockerfile
cat > Dockerfile << _EOF_
FROM alpine:3.1
MAINTAINER Paolo Oliveira <paolo@fisica.ufc.br>
RUN apk add --update python
COPY sqlmap/ /sqlmap/
WORKDIR /sqlmap
ENTRYPOINT ["python", "sqlmap.py"]
_EOF_

# build the image
docker build -t paoloo/sqlmap:1.2 .
