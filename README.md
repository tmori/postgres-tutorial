# postgres-tutorial
postgres tutorial

see: https://mebee.info/2020/12/04/post-24686/

# procedure

```
$ docker-compose up -d
$ docker volume ls
$ docker-compose ps
$ docker-compose down --rmi all --volumes --remove-orphans
$ docker volume ls
```

# login

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori
```

# db list

```
$ psql -h 0.0.0.0 -p 5432 -U tmori -l
```

# DDL
## CREATE TABLE

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/create.sql
```

