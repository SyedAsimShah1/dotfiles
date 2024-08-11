return {
	"rebelot/heirline.nvim",
	enabled = true,
	config = function()
		local foldlevel = vim.fn.foldlevel
		local foldclosed = vim.fn.foldclosed
		local getcurpos = vim.fn.getcurpos

		local function is_virtual_line()
			return vim.v.virtnum < 0
		end

		local function is_wrapped_line()
			return vim.v.virtnum > 0
		end

		local function not_in_fold_range()
			return foldlevel(vim.v.lnum) <= 0
		end

		local function not_fold_start(line)
			return foldlevel(line) <= foldlevel(line - 1)
		end

		local function fold_opened(line)
			return foldclosed(line or vim.v.lnum) == -1
		end

		local Number = {
			{ provider = "%=" },
			{
				provider = function()
					local lnum = tostring(vim.v.relnum)
					if vim.v.lnum == getcurpos()[2] then
						lnum = tostring(vim.v.lnum)
					end

					if is_virtual_line() then
						return string.rep(" ", #lnum)
					elseif is_wrapped_line() then
						return " " .. string.rep(" ", #lnum)
					else
						return (#lnum == 1 and "  " or " ") .. lnum
					end
				end,

				hl = function()
					if vim.v.lnum == getcurpos()[2] then
						return {
							fg = "#FFD700",
						}
					end
					return nil
				end,
			},
			{ provider = " " },
		}

		local Fold = {
			provider = function()
				if is_wrapped_line() or is_virtual_line() then
					return ""
				elseif not_in_fold_range() or not_fold_start(vim.v.lnum) then
					return "  "
				elseif fold_opened() then
					return " "
				else
					return ""
				end
			end,
			hl = {
				fg = "#959da9",
				bg = "#22252A",
				bold = true,
			},
			on_click = {
				name = "heirline_fold_click_handler",
				callback = function()
					local line = vim.fn.getmousepos().line

					if not_fold_start(line) then
						return
					end

					vim.cmd.execute("'" .. line .. "fold" .. (fold_opened(line) and "close" or "open") .. "'")
				end,
			},
		}

		local nmarks = 0
		local GitSigns = {
			init = function(self)
				local ns_id = vim.api.nvim_get_namespaces()["gitsigns_signs_"]
				if ns_id then
					local marks = vim.api.nvim_buf_get_extmarks(
						0,
						ns_id,
						{ vim.v.lnum - 1, 0 },
						{ vim.v.lnum, 0 },
						{ limit = 1, details = true }
					)
					nmarks = #marks
					if nmarks > 0 then
						local hl_group = marks[1][4]["sign_hl_group"]
						self.highlight = hl_group
					else
						self.highlight = nil
					end
				end
			end,
			provider = function()
				if nmarks > 0 then
					return "▐"
				end
				return ""
			end,
			hl = function(self)
				return self.highlight or "StatusColumnBorder"
			end,
		}

		local column = { GitSigns, Number, Fold }
		require("heirline").setup({
			statuscolumn = column,
		})
	end,
}
