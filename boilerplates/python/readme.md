
<!-- omit in toc -->
# python flask boilerplate

python flask boilerplate for applications

<!-- omit in toc -->
## contents

- [setup on linux with venv](#setup-on-linux-with-venv)
- [setup on windows with venv](#setup-on-windows-with-venv)
- [setup with docker](#setup-with-docker)
- [usage](#usage)
- [sources](#sources)

## setup on linux with venv

```sh
#!/bin/sh

set -e

python3 -m venv .venv

source .venv/bin/activate

pip install -r requirements.txt

```

## setup on windows with venv

```sh

python3 -m venv .venv

\venv\Scripts\activate.bat

pip install -r requirements.txt

```

## setup with docker

see docker documentation

## usage

execute with venv

- execute app.py
- open <http://http://localhost:8000/>

execute with docker

- see docker documentation
- execute docket container with app.py

## sources

[python flas boilerplate](https://www.python-boilerplate.com/py3+flask+executable+logging)
