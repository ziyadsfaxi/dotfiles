return {
  enabled = false,
  "kiddos/gemini.nvim",
  -- config = function()
  --   require("gemini").setup()
  -- end,
  opts = function()
    local api = require("gemini.api")

    return {
      model_config = {
        model_id = api.MODELS.GEMINI_1_5_PRO,
      },
    }
  end,
}
