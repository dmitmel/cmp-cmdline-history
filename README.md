# cmp-cmdline-history

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) source for getting completions from command-line (`:` or Ex-mode) or search (`/` and `?`) histories. Intended for use with the recently-introduced [cmdline completion feature](https://github.com/hrsh7th/nvim-cmp/pull/362).

See also: [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)

## Usage

Basic example: will complete previously typed Ex commands when in the command-line mode.

```lua
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline_history' },
  },
})
```

A more advanced example: this will also setup the history completion for all other command-line modes.

```lua
for _, cmd_type in ipairs({':', '/', '?', '@'}) do
  cmp.setup.cmdline(cmd_type, {
    sources = {
      { name = 'cmdline_history' },
    },
  })
end
```

By default this source will read the history for the current mode, but you can also force it to use some other mode with the `history_type` option. The possible values for it can be found in [`:help hist-names`](https://neovim.io/doc/user/builtin.html#hist-names) and [`:help getcmdtype()`](<https://neovim.io/doc/user/builtin.html#getcmdtype()>). Not sure how this can be useful, but I guess you could use it to autocomplete Ex commands in a Vimscript file:

```vim
autocmd FileType vim lua require('cmp').setup.buffer({
\   sources = {
\     {
\       name = 'cmdline_history',
\       opts = { history_type = ':' },
\     },
\   },
\ })
```
