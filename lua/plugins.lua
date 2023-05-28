-- 起動時にpacker.nvimが自動で読み込まれないとき実行する
-- vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- この下にインストールするプラグインを記載します。
  use 'folke/tokyonight.nvim'

end)
