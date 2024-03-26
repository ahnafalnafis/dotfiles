local command = vim.api.nvim_create_user_command

local session_dir = vim.env.HOME .. "/.cache/vim/session"
local session_file_name = vim.env.PWD:gsub("/", "__") .. ".vim"
local session_file = string.format("%s/%s", session_dir, session_file_name)

if not vim.fn.isdirectory(session_dir) then
  vim.fn.mkdir(session_dir)
  require("notify")("Ceated session directory at " .. session_dir)
end

local function save_session()
  local choice = vim.fn.confirm("Save this session?", "&Yes\n&No")

  if choice ~= 1 then
    return
  end

  vim.cmd.mksession(session_file)
end

local function restore_session()
  if vim.fn.filereadable(session_file) then
    vim.cmd.source(session_file)
  end
end

local function delete_session()
  vim.cmd("!rm " .. session_file)
end

vim.opt.sessionoptions:remove("options")

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

command("Del", delete_session, {})
command("DeleteSession", delete_session, {})

command("Save", save_session, {})
command("SaveSession", save_session, {})
