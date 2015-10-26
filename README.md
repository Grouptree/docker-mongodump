# docker-mongodump

A simple docker image to quickly create mongo dumps from the command-line.

It runs [mongodump](https://docs.mongodb.org/manual/reference/program/mongodump/) with the specified arguments as host and database and gzips the resulting files, outputing the resulting `.tar.gz` file to `STDOUT`.

Sample usage:

```
$ docker run --rm grouptree/mongodump localhost mydb > db.tar.gz
```
