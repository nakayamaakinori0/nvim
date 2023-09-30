print("helloWorld")
require("plugins")
require("autocmds")
require("options")
require("keymaps")

vim.cmd[[colorscheme tokyonight-night]]

require("lualine").setup()
require("tabline").setup()
require("mini.indentscope").setup({
  symbol = "▏",
})
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
})
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
require('im_select').setup {
  default_im_select = 'com.apple.keylayout.ABC'
}
