<!-- omit in toc -->
# jobs ⛑️

commands for control jobs

<!-- omit in toc -->
## contents

- [job status](#job-status)
- [at - execute jobs](#at---execute-jobs)
- [cron jobs](#cron-jobs)

## job status

list jobs

```sh
jobs
jobs -p (pid)
```

start job in the background - &

```sh
execute_script.sh &
```

put ob in the foreground

```sh
fg %1 (jobnumber)
```

put ob in the background

```sh
bg %1 (jobnumber)
```

stop job

```sh
stop %1 (jobnumber)
```

kill all jobs

```sh
kill -9 $(jobs -p)
```

start program in foreground and hit `CTRL + Z`

```sh
jobs
fg %1 (jobnumber)
```

## at - execute jobs

configuration file `/etc/cron.d/at`

execute at a specific time

```sh
at -f /home/youscript.sh 1200
```

execute at a specific date and time

```sh
at -t 11102344 -f /home/youscript.sh 1200
```

list queued jobs

```sh
at -l
atq
```

remove queued jobs

```sh
at -r (jobid)
atrm (jobid)
```

## cron jobs

use `/etc/cron.d/` folder and shell scripts

edit users crontab settings

```sh
crontab -e
```

execution samples

```sh
SHELL=/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin
HOME=/var/log
#
#minute (0-59)
#|   hour (0-23)
#|   |    day of the month (1-31)
#|   |    |   month of the year (1-12 or Jan-Dec)
#|   |    |   |   day of the week (0-6 with 0=Sun or Sun-Sat)
#|   |    |   |   |   commands
#|   |    |   |   |   |
#### rotate logs weekly (Sunday at midnight)
00   0    *   *   0   /usr/local/bin/test.sh
```
