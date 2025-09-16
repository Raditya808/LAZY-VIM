return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			auto_scroll = true,
			shell = vim.fn.has("win32") == 1 and "pwsh" or vim.o.shell,

			on_open = function()
				vim.cmd("startinsert!")
			end,

			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			insert_mappings = true,
			persist_size = true,
			close_on_exit = true,

			float_opts = {
				border = "curved", -- bisa diganti "single" kalau mau lebih lurus/clean
				width = 75, -- lebar terminal (px terminal / kolom teks)
				height = 40, -- tinggi terminal
				winblend = 0, -- transparansi (0 = solid)
			},
		})
	end,
}
