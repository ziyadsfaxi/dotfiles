return {
  desc = "Restart DAP when dotnet watch indicates a successful build",
  -- Define parameters if needed (we don't need any for this)
  params = {},
  -- The constructor returns the actual component logic
  constructor = function(params)
    return {
      on_output_lines = function(self, task, lines)
        for _, line in ipairs(lines) do
          -- Strip ANSI color codes to ensure we match the text correctly
          -- (dotnet watch usually outputs green text)
          local clean_line = line:gsub("\x1b%[[0-9;]*m", "")

          if clean_line:match("Build succeeded") then
            -- Use pcall to check if DAP is loaded and has an active session
            local ok, dap = pcall(require, "dap")
            if ok and dap.session() then
              -- Schedule the restart on the main UI thread
              vim.schedule(function()
                vim.notify("♻️  Build updated. Restarting Debugger...", vim.log.levels.INFO)
                dap.restart()
              end)
            end
          end
        end
      end,
    }
  end,
}
