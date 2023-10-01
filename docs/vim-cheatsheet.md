# Vim Cheatsheet

Features and mapping of vim/lunarvim, (some specific to my config), that I
often forgot and are useful.

## Registers

Use `"` to use a register.

`"%`: name of the current file
`"#`: name of the last edited file
`":`: last command executed

## Command mode tricks

Use `@:` in normal mode to execute last command.

Use `<C-R>{0-9a-z|%#:-=.}` in command line to insert content of register.
Use `<C-R><C-R>` to insert the content of the register literally.

Use `<C-R><C-W>`, to insert the word from the buffer to the command line
(`C-A`, `C-F` and `C-P` work as well for WORD, path and PATH).

During command execution (i.e. `:!ls`), `%` is replace with the current
filename. You can add modifiers: `%:p` for fullpath, `%:h` & `%:t` for head and
tail components, `%:r` to remove the extension and `%:e` to keep the extension,
and `%:.` for a relative path to the current directory.

## Mappings

| Mapping               | Mode(s) | Added manually | Description           |
| -                     | -       | -              | -                     |
| `<Left>`              | n       | X              | Resize window         |
| `<Right>`             | n       | X              | Resize window         |
| `<Up>`                | n       | X              | Resize window         |
| `<Down>`              | n       | X              | Resize window         |
| `<leader>h`           | n       | Yes for vim    | :noh                  |
| `K`                   | n       | Yes for vim    | hover information     |
| `gd`                  | n       | Yes for vim    | go to definition      |
| `gD`                  | n       | Yes for vim    | go to declaration     |
| `gr`                  | n       | Yes for vim    | go to references      |
| `gI`                  | n       | Yes for vim    | go to implementation  |
| `gs`                  | n       | Yes for vim    | show signature help   |
| `gl`                  | n       | Yes for vim    | show line diagnostics |
| `<leader>lf`          | n       | Yes for vim    | Format current file   |
| `<leader>lr`          | n       | Yes for vim    | Rename variable       |
| `gq`                  | n       |                | Line format operator  |
| `<leader>s<something` | n       | Yes for vim    | Search for something  |

## Vim Only

| Mapping     | Mode(s) | Added manually ? | Description       |
| -           | -       | -                | -                 |
| `<leader>e` | n       | X                | Open tree (netwr) |
| `<leader>f` | n       | X                | FZF               |

## LVim Only

| Mapping           | Mode(s) | Added manually ? | Description                 |
| -                 | -       | -                | -                           |
| `<M-j>`           | n i v   |                  | move current line           |
| `<M-k>`           | n i v   |                  | move current line           |
| `gcc` `<leader>/` | n       |                  | Comments.nvim comment line  |
| `gbc`             | n       |                  | Comments.nvim comment block |
| `<leader>e`       | n       |                  | open tree                   |
| `<leader>;`       | n       |                  | dashboard                   |
| `<leader>f`       | n       |                  | telescope                   |
| `<C-space>`       | i       |                  | show completion menu        |

## vim-easy-align

See full doc [here](https://github.com/junegunn/vim-easy-align)

| Mapping      | Mode(s) | Added manually ? | Description          |
| -            | -       | -                | -                    |
| `<leader>ga` | n v     | X                | run the align plugin |

## unimpared.nvim/unimpared.vim

See full doc [here](https://github.com/tpope/vim-unimpaired) and
[here](https://github.com/Tummetott/unimpaired.nvim#default-configuration).

| Mapping      | Mode(s) | Description        |
| -            | -       | -                  |
| `[q`         | n       | move in quickfix   |
| `[a`         | n       | move in arglist    |
| `[b`         | n       | move in bufferlist |
| `[l`         | n       | move in loclist    |
| `[<Space>`   | n       | Add blank lines    |
| `[x{Motion}` | n       | encode XML         |
| `[u{Motion}` | n       | encode URL         |
| `[y{Motion}` | n       | encode C           |
| `[C{Motion}` | n       | ^                  |
| `[e`         | n       | move current line  |
