# docker-mongodump

A simple docker image to quickly create mongo dumps from the command-line.

# Usage

This will fire up a container linked to another mongo container (named **mydb**) and create a dump of the **invoices** database, zipping its resulting files and copying the gzipped file to `/backups/invoices/2015-10-27-09-59.tar.gz` (with the appropriate timestamp). It will also symlink `/backups/invoices/latest.tar.gz` to it: 

```
$ docker run grouptree/mongodump --link mydb:db db invoices
```

You will probabaly want to link a volume-only container where you keep your backups, and dispose of this container after using it:

```
$ docker run grouptree/mongodump --link mydb:db --volumes-from backup-container --rm db invoices
```

**Warning**: it is probabaly not a good idea to use this against a production mongo container during high traffic hours. Please read [the mongodump reference](https://docs.mongodb.org/manual/reference/program/mongodump/) to understand the implications regarding database read locks etc.
