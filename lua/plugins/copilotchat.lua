return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- opsi konfigurasi bisa ditaruh di sini
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function()
					-- Biar buffer CopilotChat bisa diketik
					vim.bo.readonly = false
					vim.bo.modifiable = true
				end,
			})
		end,
	},
}
-- copilot-chat
-- unstable
