local command = vim.api.nvim_create_user_command

local session_path = vim.fn.stdpath("state") .. "/session"
local session_file_name = vim.fn.getcwd():gsub("/", "__") .. ".vim"
local session_file = string.format("%s/%s", session_path, session_file_name)

local session_dir_exists = vim.fn.isdirectory(session_path) == 1
local session_file_exists = vim.fn.filereadable(session_file) == 1

if not session_dir_exists then
  vim.fn.mkdir(session_path)
  require("notify")("Ceated session directory at " .. session_path)
end

-- Save session.
local function save_session()
  local choice = vim.fn.confirm("Save this session?", "&Yes\n&No")

  if choice ~= 1 then
    return
  end

  vim.cmd.mksession({ args = { session_file }, bang = true })
end

-- Restore session.
local function restore_session()
  if session_file_exists then
    vim.cmd.source(session_file)
  end
end

-- Delete session.
local function delete_session()
  vim.cmd("!rm " .. session_file)
end

-- Do not store current options.
vim.opt.sessionoptions:remove("options")

-- Setting up auto commands.
local sesseionize = vim.api.nvim_create_augroup("sesseionize", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = sesseionize,
  pattern = "*",
  callback = restore_session,
  nested = true,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = sesseionize,
  pattern = "*",
  callback = save_session,
})

-- Convenient commands.
command("SaveSession", save_session, {})
command("DeleteSession", delete_session, {})
