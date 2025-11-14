-- ~/.config/nvim/lua/plugins/cord.lua
return {
  "vyfor/cord.nvim",
  lazy = false,
  config = function()
    require("cord").setup({
      -- Ubah dari 'debug' ke 'warn' atau 'error'
      log_level = "warn",
      -- ... konfigurasi lainnya
      text = {
        title = "Cord",
        subtitle = "Neovim config",
      },
    })
  end,
}

