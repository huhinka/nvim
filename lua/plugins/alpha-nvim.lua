-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    -- customize the dashboard header
    local logo = {
      "                                                                    ─▄▀─▄▀   ",
      "                                                                    ──▀──▀   ",
      "░█─░█ ░█─░█ ░█─▄▀ █▀▀█ █ █▀▀ 　 ░█▀▀▀█ ▀▀█▀▀ █──█ █▀▀▄ ─▀─ █▀▀█     █▀▀▀▀▀█▄ ",
      "░█▀▀█ ░█▀▀█ ░█▀▄─ █▄▄█ ─ ▀▀█ 　 ─▀▀▀▄▄ ──█── █──█ █──█ ▀█▀ █──█     █░░░░░█─█",
      "░█─░█ ░█─░█ ░█─░█ ▀──▀ ─ ▀▀▀ 　 ░█▄▄▄█ ──▀── ─▀▀▀ ▀▀▀─ ▀▀▀ ▀▀▀▀     ▀▄▄▄▄▄▀▀ ",
    }
    opts.section.header.val = logo

    local get_icon = require("astroui").get_icon
    opts.section.buttons.val = {
      opts.button("LDR P  ", get_icon("FolderClosed", 2, true) .. "Open Project  "),
      opts.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      opts.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      opts.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      opts.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      opts.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      opts.button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
    }
    return opts
  end,
}
