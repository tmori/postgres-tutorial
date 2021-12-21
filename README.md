# postgres-tutorial
postgres tutorial

# see
 - https://mebee.info/2020/12/04/post-24686/
 - https://qiita.com/aoi_erimiya/items/a37890fb4719357f7f87
 - https://qiita.com/bwtakacy/items/65260e29a25b5fbde835
 - https://qiita.com/d0ne1s/items/8de0ce7efdeec999170e

# install

```
$ sudo apt install postgresql postgresql-contrib
```

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

# Backup & Restore
## ONLINE && LOGICAL 

### backup

```
$ pg_dump -h 0.0.0.0 -p 5432 -d sample -U tmori -f online_backup/sample.backup
```

### restore

```
$ psql -h 0.0.0.0 -p 5432 -d sample -U tmori -f online_backup/sample.backup
```

## OFFLINE && PHYSICAL

### prepare

```
$ docker-compose ps
 Name                Command              State           Ports
------------------------------------------------------------------------
db_db_1   docker-entrypoint.sh postgres   Up      0.0.0.0:5432->5432/tcp

$ docker-compose stop
Stopping db_db_1 ... done

$ docker volume ls
DRIVER    VOLUME NAME
local     db_postgres
```

### backup

```
$ docker run --rm \
    --volumes-from db_db_1  \
    -v `pwd`/offline_backup:/backup \
    busybox tar cvzf /backup/backup.tar.gz \
    /var/lib/postgresql/data
```

#### Argument Explanations 

- --volumes-from
  - backup target volume belonging to docker container(db_db_1)
- -v `pwd`/offline_backup:/backup
  - `pwd`/offline_backup: host backup destination
  - /backup: container mount path
- busybox tar cvf /backup/backup.tar /var/lib/postgresql/data
  - backup execution docker container operation

要するに，バックアップ対象のvolumeを保持しているdockerコンテナを volumes-from で指定することで，busybox の docker コンテナが当該 volume にアクセスできるようにするということ．

```
$ ls offline_backup/
backup.tar.gz
```
### restore

```
$ docker run --rm \
    --volumes-from db_db_1 \
    -v `pwd`/offline_backup:/backup \
    busybox tar xzvf /backup/backup.tar.gz
$ docker-compose up -d
```

# Remove all

```
$ docker-compose down --rmi all --volumes --remove-orphans
```
