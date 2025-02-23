local state = {
  win = -1,
  buf = -1
}

local float_terminal = function(opts)

  opts = opts or {}
    
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2 )

local win_config = {
    relative = "win",
    style = "minimal",
    border = "rounded",
    row = row,
    col = col,
    width = width,
    height = height,
  }

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { win = win, buf = buf }
end

vim.api.nvim_create_user_command("Floaterminal", function()

  if not vim.api.nvim_win_is_valid(state.win) then
    state = float_terminal({ buf = state.buf })
    if vim.bo[state.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.win)
  end
end,
  {}
)

vim.keymap.set("n", "<leader>t", "<cmd>Floaterminal<CR>")
