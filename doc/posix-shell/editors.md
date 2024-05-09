<!-- omit in toc -->
# editors 💦

commands for vi

<!-- omit in toc -->
## contents

- [vi editor mode](#vi-editor-mode)
- [vi command mode `:`](#vi-command-mode-)
- [vi input mode](#vi-input-mode)
- [setup vi/vim](#setup-vivim)

## vi editor mode

- [vi editor mode](#vi-editor-mode)
- [vi command mode `:`](#vi-command-mode-)
- [vi input mode](#vi-input-mode)
- [setup vi/vim](#setup-vivim)

## vi command mode `:`

- `:wq!` save and quit
- `:r file` read file
- `:w (file)` write file
- `q!` quit without saving
- `:w !sudo tee %` write as user

## vi input mode

- `a` insert char right at the cursor
- `i` insert char left to the cursor
- `o` add a new line after the current line

## setup vi/vim

install vim

```sh
pkg install vim
```

vi(m) options  `~/.exrx` `~/.vimrc`

```sh
:set number
```
