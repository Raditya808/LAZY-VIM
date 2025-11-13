return {
  -- 💤 Dashboard mirip LazyVim
  {
    "goolord/alpha-nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons", "lazy.nvim" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ⚡️ Fungsi untuk mendapatkan status load dari lazy.nvim (DIPERBAIKI)
      local function lazy_load_status()
        local lazy_config = package.loaded["lazy.core.config"]

        if lazy_config and lazy_config.stats then
          -- Panggil stats dengan pcall untuk keamanan ekstra
          local ok, stats = pcall(lazy_config.stats)
          if ok and stats and stats.loaded and stats.start then
            
            -- Perbaikan utama: Menggunakan waktu start dan total untuk kalkulasi waktu yang lebih akurat
            -- stats.start adalah waktu sebelum load, vim.loop.hrtime() adalah waktu sekarang.
            local total_time_ns = vim.loop.hrtime() - stats.start
            -- Konversi dari nanodetik ke milidetik dan bulatkan ke 2 desimal
            local ms = math.floor(total_time_ns / 1e6 * 100 + 0.5) / 100
            
            -- Ambil jumlah total plugin
            local plugins = #vim.tbl_keys(lazy_config.plugins or {})

            return string.format(
              "⚡ Neovim loaded %d/%d plugins in %.2fms",
              stats.loaded,
              plugins,
              ms
            )
          end
        end

        -- Fallback: Tampilkan jumlah plugin yang diketahui jika memungkinkan
        if lazy_config and lazy_config.plugins then
          local plugins = #vim.tbl_keys(lazy_config.plugins or {})
          return string.format("⚡ Neovim loaded %d plugins", plugins)
        end

        -- Fallback paling aman jika data lazy.nvim belum ada sama sekali
        return "⚡ Neovim loaded"
      end

      -- 💤 ASCII header (DIBERSIHKAN)
      dashboard.section.header.val = {
          -- Baris kosong dan baris akhir dibersihkan dari spasi berlebihan
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[                                                                                    ]], 
          [[              ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗            Z ]],
          [[              ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║          Z   ]],
          [[              ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║        z     ]],
          [[              ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z            ]],
          [[              ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║              ]],
          [[              ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝              ]],
      }

      -- Tombol-tombol menu utama (TIDAK BERUBAH)
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
        dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", "  Find Text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "󰑓  Restore Session", [[<cmd>lua require("persistence").load()<cr>]]),
        dashboard.button("x", "  Lazy Extras", ":LazyExtras <CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Warna & penataan (TIDAK BERUBAH)
      dashboard.section.header.opts.hl = "Title"
      dashboard.section.buttons.opts.hl = "Function"
      dashboard.section.footer.opts.hl = "Comment"

      -- Footer menggunakan fungsi yang sudah diperbaiki
      dashboard.section.footer.val = lazy_load_status()

      -- Menengahkan layout (TIDAK BERUBAH)
      dashboard.config.layout = {
        { type = "padding", val = 6 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)

      -- 🌈 Warna untuk header dan tombol (TIDAK BERUBAH)
      vim.cmd([[
        highlight Title guifg=#5EA0EA
        highlight Function guifg=#89B4FA
        highlight Comment guifg=#6C7086
      ]])
    end,
  },

  -- 🌈 Lualine (status bar) - TIDAK ADA PERUBAHAN, sudah bagus
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = "|",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}