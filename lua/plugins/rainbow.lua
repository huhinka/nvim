return {
  {
    "AstroNvim/astroui",
    ---@param opts AstroUIOpts
    opts = function(_, opts)
      if not opts.highlights then opts.highlights = {} end
      local init_highlights = opts.highlights.init or {}
      opts.highlights.init = function(colorscheme)
        if type(init_highlights) == "function" then init_highlights = init_highlights(colorscheme) end
        for hlgroup, fallback in pairs {
          RainbowRed = { fg = "#E06C75" },
          RainbowYellow = { fg = "#E5C07B" },
          RainbowBlue = { fg = "#61AFEF" },
          RainbowOrange = { fg = "#D19A66" },
          RainbowGreen = { fg = "#98C379" },
          RainbowViolet = { fg = "#C678DD" },
          RainbowCyan = { fg = "#56B6C2" },
          RainbowRedIndent = { fg = "#6e171e" },
          RainbowYellowIndent = { fg = "#765517" },
          RainbowBlueIndent = { fg = "#0c497a" },
          RainbowOrangeIndent = { fg = "#603d1d" },
          RainbowGreenIndent = { fg = "#3b5727" },
          RainbowVioletIndent = { fg = "#5a1b6d" },
          RainbowCyanIndent = { fg = "#1e4c52" },
        } do
          if vim.fn.hlexists(hlgroup) ~= 1 then init_highlights[hlgroup] = fallback end
        end
        return init_highlights
      end
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    opts = {
      highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { char = "▏", show_start = true, show_end = true },
      indent = {
        char = "╎",
        highlight = {
          "RainbowRedIndent",
          "RainbowYellowIndent",
          "RainbowBlueIndent",
          "RainbowOrangeIndent",
          "RainbowGreenIndent",
          "RainbowVioletIndent",
          "RainbowCyanIndent",
        },
      },
    },
  },
}
