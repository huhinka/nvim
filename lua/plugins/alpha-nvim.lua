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
    return opts
  end,
}
