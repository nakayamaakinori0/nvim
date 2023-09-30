-- Packer auto install
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- この下にインストールするプラグインを記載します。
  -- colortheme
  use 'folke/tokyonight.nvim'
  use 'sainnhe/everforest'

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
  use 'keaising/im-select.nvim'


end)
