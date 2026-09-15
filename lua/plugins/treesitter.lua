local installed = nil ---@type table<string, boolean>?

local function get_installed(update)
	if update then
		installed = {}
		for _, lang in ipairs(require("nvim-treesitter").get_installed("parsers")) do
			installed[lang] = true
		end
	end
	return installed or {}
end

local function have(ft, query)
	local lang = vim.treesitter.language.get_lang(ft)
	if lang == nil or get_installed()[lang] == nil then
		return false
	end
	if query and vim.treesitter.query.get(lang, query) == nil then
		return false
	end
	return true
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		build = ":TSUpdate",
		lazy = false,
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		opts_extend = { "ensure_installed" },
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"go",
				"javascript",
				"lua",
				"rust",
				"typescript",
				"vimdoc",
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")
			TS.setup(opts)
			get_installed(true)

			local install = vim.tbl_filter(function(lang)
				return not have(lang)
			end, opts.ensure_installed or {})
			if #install > 0 then
				TS.install(install):await(function()
					get_installed(true)
				end)
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
				callback = function(ev)
					local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
					if not have(ft) then
						return
					end

					local function enabled(feat, query)
						local f = opts[feat] or {}
						return f.enable ~= false
							and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
							and have(ft, query)
					end

					if enabled("highlight", "highlights") then
						pcall(vim.treesitter.start, ev.buf)
					end

					if enabled("indent", "indents") then
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
