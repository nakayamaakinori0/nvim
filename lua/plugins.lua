-- 起動時にpacker.nvimが自動で読み込まれないとき実行する
-- vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- この下にインストールするプラグインを記載します。
  use 'folke/tokyonight.nvim'
  use {
    "nvim-lualine/lualine.nvim",
    require = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  use("nvim-tree/nvim-web-devicons")
  use("kdheepak/tabline.nvim")
  use("echasnovski/mini.indentscope")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
        -- add any options here
    })
  end,
  requires = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  })
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})


end)
