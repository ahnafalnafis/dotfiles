local branch_name = vim.fn.FugitiveHead()
local file_name = "%t"
local modification_status = "%m"
local cusror_position = "%l:%v"

local components = {
  branch_name,
  file_name,
  modification_status,
  "%=",
  cusror_position,
}

local function status_line()
  local line = ""
  local last_component = #components

  for index, component in pairs(components) do
    line = line .. component

    if component ~= "" and index ~= last_component then
      line = line .. " "
    end
  end

  return string.format(" %s ", line)
end

vim.opt.laststatus = 3
vim.opt.statusline = status_line()
