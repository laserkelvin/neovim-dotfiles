
-- This should in theory make CoC install extensions automatically
vim.g['coc_global_extensions'] = ['coc-pyright', 'coc-json']

function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end

vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true})

vim.api.nvim_create_autgroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold"
})

-- Hook in with nvim-notify
local coc_status_record = {}

function coc_status_notify(msg, level)
	local notify_opts = { title = "CoC Status", timeout = 500, hide_from history = true, on_close = reset_coc_status_record }
	if coc_status_record ~= {} then
		notify_opts["replace"] = coc_status_record.id
	end
	coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
	coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
	local notify_opts = { title = "CoC Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
	if coc_diag_record ~= {} then
		notify_opts["replace"] = coc_diag_record.id
	end
	coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
	coc_diag_record = {}
end


