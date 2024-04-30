<!-- omit in toc -->
# setup 💾

setup docker with the commandline

<!-- omit in toc -->
## contents

- [remote repo configuration](#remote-repo-configuration)
- [set username and mail with console](#set-username-and-mail-with-console)
- [set user and mail with config files](#set-user-and-mail-with-config-files)


## remote repo configuration

check remote repo configuration

```sh
git remote -v
```

set repo when not cloned from server

```sh
git remote add origin https://yourgithubserver.com/yourrepo.git
```

## set username and mail with console

for global repos

```sh
git config --global user.name "myusername"
git config --global user.email "global@mail.com"
```

for local repos

```sh
git config user.name "myusername"
git config user.email "local@mail.com"
```

## set user and mail with config files

the global configuration can be found in `.gitconfig`

```sh
[user]
 name = global_user
 email = global_email
```

when more different accounts are used create a global `.gitconfig`

```sh
[includeIf "gitdir:~/private/"]
  path = ~/.gitconfig-private
[includeIf "gitdir:~/public/"]
  path = ~/.gitconfig-public
```

and different other files for each directory `.gitconfig-private`

```sh
[user]
 name = private_user
 email = private_email
```
