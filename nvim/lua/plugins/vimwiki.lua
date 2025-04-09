return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_listsyms = "✗○◐●✓"
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_stripsym = ' '
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki/",
        syntax = "markdown",
        auto_tags = 1,
        ext = ".md",
      }
    }
  end,
}
