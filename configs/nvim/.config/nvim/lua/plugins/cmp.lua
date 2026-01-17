return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = { 
      preset = 'default',
      ["<C-n>"] = { 'select_next', 'snippet_forward', 'fallback' },
      ["<C-p>"] = { 'select_prev', 'snippet_backward', 'fallback' }
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    signature = { enabled = true }
  },
}
