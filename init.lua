-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("language en_US")

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h14"
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_window_blurred = true
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.keymap.set({ "n", "i" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
  -- Allow clipboard paste in neovim
  vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<D-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })

  local function set_ime(args)
    if args.event:match("Enter$") then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "cd ~/Developer/" })
end
