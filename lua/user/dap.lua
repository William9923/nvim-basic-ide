local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

vim.fn.sign_define("dapbreakpoint", { text = "", texthl = "diagnosticsignerror", linehl = "", numhl = "" })
dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

local dap_py_install_status_ok, dap_py = pcall(require, "dap-python")
if not dap_py_install_status_ok then
    return
end

local dap_go_install_status_ok, dap_go = pcall(require, "dap-go")
if not dap_go_install_status_ok then
	return
end
-- add other configs here
dap_py.setup('~/.virtualenvs/debugpy/bin/python')
dap_py.test_runner = "pytest"
dap_go.setup()

-- Optional plugins
local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if dap_virtual_text_status_ok then
    return
end

dap_virtual_text.setup()
