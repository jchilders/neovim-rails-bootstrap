Zsh/Neovim/Tmux configurations targeted towards Ruby on Rails development under
macOS. Provides the following out of the box:

- zsh fuzzy file finding
- zsh hotkeys (widgets) for common tasks
- neovim LSP integration for Ruby
- neovim fuzzy search via telescope.neovim
- Tab completion for neovim
- Run tests from within neovim 
- tmux session/window/pane management

![](nvim-tscope-sym.png)

# Installation

`make install` - Installs homebrew, Ruby, default homebrew formalae (including tmux),
builds Neovim from source, and links all configuration files (dotfiles). Typically used when
needing to bootstrap up a new laptop used in development.

`make dotfiles` - Links configuration files (dotfiles) only, without installing anything

`make neovim-config neovim-plugins` - Install neovim configuration files
(dotfiles) and plugins. Use this if you already have neovim installed and just
want to test out the neovim configuration.

`make zsh-config` - Install zsh configuration files (dotfiles). Use this if you
just want to test out the zsh configuration.

`make` - List all available targets

# zsh
## Mappings
The following mappings (widgets) are available from the zsh prompt:

| mapping | description |
| :-----: | :---------- |
| `^oa` | Fuzzy find modified file & add to staging area (`git add`) |
| `^oc` | Fuzzy find Rails controller & edit |
| `^od` | Fuzzy find modified file & diff |
| `^of` | Fuzzy find *any* file (ignores `.gitignore`) & edit |
| `^om` | Fuzzy find Rails model & edit |
| `^os` | Fuzzy find modified file & edit
| `^ov` | Fuzzy find Rails view & edit |
| `^t` | Fuzzy find file and append to current cursor position |
| `^r` | Fuzzy search command history (`^r<enter>` to run last command) |

## Aliases
Defined in `zsh/config/aliases.zsh`

| alias | description |
| :---: | :---------- |
| `bi` | `bundle install` |
| `gcb` | Copies current branch name to pasteboard (clipboard) |
| `gd` | `git diff` |
| `gst` |  `git status -sb` |
| `rc` | `rails console` |
| `rdbm` | `rake db:migrate` |
| `rdbms` | `rake db:migrate:status` |
| `rdbmt` | `rake db:migrate RAILS_ENV=test` |
| `rdbmst` | `rake db:migrate:status RAILS_ENV=test` |
| `rs` | `rails server` |

## Directory Navigation

Use `z`. For example:

```
~ ➜ cd ~/workspace/myrailsproj
myrailsproj on  master via 💎 v3.0.0 ➜ cd
~ ➜ z proj
myrailsproj on  master via 💎 v3.0.0 ➜ 
```

## Working with git

This shows a Rails project with two modified files. They are each diffed using `^od`, then added to the git staging area using `^oa`. 

![](ctrlo-git.gif)

# Neovim

Leader key is `,`.

## Mappings


| mapping | description | provided by |
| :-----: | :---------- | :---------: |
| `^ob` | Fuzzy switch buffer by filename | telescope.nvim |
| `^oc` | Fuzzy find Rails controller & edit | telescope.nvim |
| `^of` | Fuzzy find file & edit | telescope.nvim |
| `^om` | Fuzzy find Rails model & edit | telescope.nvim |
| `^or` | Fuzzy go to symbol (method name, etc.) | telescope.nvim |
| `^os` | Fuzzy find modified file & edit | telescope.nvim |
| `^ov` | Fuzzy find Rails view & edit | telescope.nvim |
| `,,` | Switch between next/previous buffers |
| `,ccs` | Change (rename) current symbol | neovim LSP |
| `,fmt` | Format current buffer | neovim LSP |
| `gJ` | Join code block | splitjoin.vim |
| `gS` | Split code block | splitjoin.vim |
| `,]]` | Go to next error/warning | neovim LSP |
| `,[[` | Go to previous error/warning | neovim LSP |
| `,g` | Toggle gutter | Native |
| `,c<Space>` | Comment/uncomment current line | nerd-commenter |
| `3,c<Space>` | Comment/uncomment 3 lines | nerd-commenter |
| `<Enter>` | Clear highlighted search | Native |

## Ruby- and Rails-specific Mappings
| mapping | description |
| :-----: | :---------- |
| `^oc` | Fuzzy find Rails controller & edit | telescope.nvim |
| `^om` | Fuzzy find Rails model & edit | telescope.nvim |
| `^ov` | Fuzzy find Rails view & edit | telescope.nvim |
| `,bp` | Insert `binding.pry` statement below current line |
| `,bP` | Insert `binding.pry` statement above current line |
| `,rp` | Insert `puts` statement below current line |
| `,rP` | Insert `puts` statement above current line |
