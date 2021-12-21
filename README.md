# postgres-tutorial
postgres tutorial

# see
 - https://mebee.info/2020/12/04/post-24686/
 - https://qiita.com/aoi_erimiya/items/a37890fb4719357f7f87

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

# DDL(Data Definition Language)
## CREATE TABLE

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/create.sql
```

## CREATE VIEW
```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/create-view.sql
```


## DROP TABLE

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/drop.sql
```

## DROP VIEW

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/drop-view.sql
```

# DML(Data Manipulation Language)

## INSERT

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/insert.sql
```

## SELECT

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/select.sql
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/select-distinct.sql
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/select-combine.sql
```

## UPDATE

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/update.sql
```

## DELETE

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/delete.sql 
```

# DCL(Data Control Language)
## SUCCESS

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/transaction-successl.sql
```

## ROLLBACK

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f sql/transaction-rollback.sql
```