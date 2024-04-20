# datasync 🔘

## rsync - remote sync

local - copy file to local folder

```sh  
rsync -azvh --progress archive.tar /tmp/
```

local - sync to two dirs

```sh
rsync -arvzh --progress /home/Administrator /home/Administrator/backup/
```

local - sync to two dirs - only update

```sh
rsync -au /home/Administrator/repo/ Administrator@192.168.1.xxx:/home/Administrator/repo
```

remote - sync to remote host

```sh
rsync -arvh --progress /home/Administrator Administrator@192.168.1.4:/tmp/backup/
rsync -arvhe ssh --progress /home/tech/django/ Administrator@192.168.1.:4/tmp/backup/ 
```

remote - sync from remote host  

```sh
rsync -arvh --progress Administrator@192.168.1.3:/home/Administrator/ /tmp/backup/
rsync -arvhe ssh --progress Administrator@192.168.1.3:/home/Administrator/ /tmp/backup/ 
```

rsync options

```sh
rsync -avzh --progress --include '.txt' --exclude '.pdf' Administrator@192.168.1.3:/tmp/backup/ /home/Administrator/
rsync -avzhe ssh --max-size='50k' /home/Administrator/ user@192.168.1.4:/tmp/backup/ 
rsync -avzhe ssh --min-size='50k' /home/Administrator/ user@192.168.1.4:/tmp/backup/ 
```

## scp - secure copy

copy from local to remote

```sh
scp -rp Repo Administrator@192.168.1.34:/home/User/Repo-main
```
