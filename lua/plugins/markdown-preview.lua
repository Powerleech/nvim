-- return {
--   {
--     "iamcco/markdown-preview.nvim",
--     build = "cd app && npm install",
--     setup = function()
--       vim.g.mkdp_filetypes = { "markdown" }
--     end,
--     ft = { "markdown" },
--   },
-- }
--
return {
  {
   "iamcco/markdown-preview.nvim",
   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
   ft = { "markdown" },
   build = function()
      vim.fn["mkdp#util#install"]()
   end,
   config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[
         function OpenMarkdownPreview (url)
            let cmd = "open -na 'Google Chrome' " . shellescape(a:url)
            silent call system(cmd)
         endfunction
      ]])
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
   end,
  }
}
