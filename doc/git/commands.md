<!-- omit in toc -->
# commands 💻

commands for control git with the console

<!-- omit in toc -->
## contents

- [repo handling](#repo-handling)
- [stage files to local repo](#stage-files-to-local-repo)
- [commit to local repo](#commit-to-local-repo)
- [push/pull from/to remote server](#pushpull-fromto-remote-server)
- [git branch](#git-branch)
- [git logs](#git-logs)
- [git local hard reset](#git-local-hard-reset)
- [git submodule](#git-submodule)


## repo handling

clone repo from server

```sh
git clone http://localhost:3000/tec/test-first
```

or create folder and init repo

```sh
mkdir test-second
git init
```

create file and check status

```sh
touch test.xml
git status
```

## stage files to local repo

stage file and check status (for stage all files use `git add --a` or `git add -A` )

```sh
git add test.xml
git status
```

unstage file if when there is a problem

```sh
git reset HEAD test.xml
```

## commit to local repo

commit stages

```sh
git commit -m "commit changes"
```

commit correct message

```sh
git commit --amend -m "commit changes corrected"
```

stage and commit all tracked files

```sh
git commit -a -m "commit changes"
```

check committs (if needed)

```sh
git log --oneline --decorate --graph --all --branches
```

set remote repo

```sh
git remote add origin http://localhost:3000/tec/test-second
```

set local user for local server

```sh
git config user.name "myusername"
git config user.email "local@mail.com"
```

## push/pull from/to remote server

push to local server

```sh
git push origin master
```

pull from server to local

```sh
git pull origin master
```

## git branch

create new branch

```sh
git branch new_branch
```

switch to new branch

```sh
git checkout new_branch
```

merge branch

```sh
git merge new_branch
```

delete branch

```sh
git branch -d new_branch
```

## git logs

show log of repo

```sh
git log
git log --oneline
git log --stat  
```

show / diff content of commit

```sh
git show (commit-id of git log)
```

## git local hard reset

local repo hard reset

```sh
git reset --hard HEAD
git clean -f -d
git pull
```

## git submodule

git submodule add to project

```sh
git submodule add https://github.com/tomatensaft/tomatoe-lib
```

git submodule remove

```sh
git submodule deinit -f ./tomatoe-lib
rm -rf .git/modules/tomatoe-lib
git rm -f :/tomatoe-lib
```
