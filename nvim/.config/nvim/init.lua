--[[
  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/
--]]
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins", {
  defaults = {
    cond = function(plugin)
      -- load only treesitter if running under vscode
      -- if plugin name contains "treesitter" return true
      if vim.g.vscode then
        if string.find(plugin.name, "treesitter") then
          return true
        end
        if string.find(plugin.name, "surround") then
          return true
        end
        return false
      else
        return true
      end
    end,
  }
})


-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = false
vim.wo.relativenumber = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.incsearch = true
vim.o.scrolloff = 3

if not vim.g.vscode then
  -- Keep signcolumn on by default
  vim.wo.signcolumn = 'yes'

  -- Decrease update time
  -- vim.o.updatetime = 250

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'

  vim.o.termguicolors = true
  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.o.foldenable = false
end

-- [[ Basic Keymaps ]]

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true })

if not vim.g.vscode then
  -- Keymaps for better default experience
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  -- [[ Highlight on yank ]]
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d',
    function()
      vim.diagnostic.goto_prev(
        {
          severity =
          {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR
          }
        })
    end,
    { desc = "Go to previous diagnostic message" })

  vim.keymap.set('n', '[e',
    function()
      vim.diagnostic.goto_prev(
        {
          severity =
          {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR
          }
        })
    end,
    { desc = "Go to previous error message" })

  vim.keymap.set('n', ']d',
    function()
      vim.diagnostic.goto_next(
        {
          severity =
          {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR
          }
        })
    end,
    { desc = "Go to next diagnostic message" })

  vim.keymap.set('n', ']e',
    function()
      vim.diagnostic.goto_next(
        {
          severity =
          {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR
          }
        })
    end,
    { desc = "Go to next error message" })

  -- LSP settings.
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local imap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
    end

    local vmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>a', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    vim.keymap.set('n', 'gp', ':<C-u>pedit %<Bar>wincmd P<Bar>:lua vim.lsp.buf.definition()<CR>',
      { silent = true, desc = 'Goto definition in a preview' })
    vim.keymap.set('n', 'gD', ':only<bar>vsplit<CR>:lua vim.lsp.buf.definition()<CR>',
      { silent = true, desc = 'Goto definition in a vertical split' })
    nmap('gy', vim.lsp.buf.type_definition, 'Goto Type [D]efinition')
    nmap('<leader>j', require('fzf-lua').lsp_live_workspace_symbols, 'Live Workspace Symbols')
    nmap('<leader>J', require('fzf-lua').lsp_workspace_symbols, 'Workspace Symbols')
    nmap('<leader>o', require('fzf-lua').lsp_document_symbols, 'Document Symbols')
    nmap('<leader>a', require('fzf-lua').lsp_code_actions, 'Code Actions')
    vmap('<leader>a', require('fzf-lua').lsp_code_actions, 'Code Actions')
    -- nmap('gD', require('fzf-lua').lsp_declarations, 'Goto Declaration')
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gi', require('fzf-lua').lsp_implementations, 'Goto Implementation')
    nmap('gr', require('fzf-lua').lsp_references, 'Goto References')
    -- nmap('<leader>e',
    --   function()
    --     require('fzf-lua').lsp_workspace_diagnostics({ winopts = { preview = { layout = 'vertical' } } })
    --   end,
    --   'Workspace Diagnostics')
    nmap('<leader>li', require('fzf-lua').lsp_incoming_calls, 'Incoming Calls')
    nmap('<leader>lo', require('fzf-lua').lsp_outgoing_calls, 'Outgoing Calls')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    require('lsp-inlayhints').on_attach(client, bufnr, false)
    require('lsp_signature').on_attach({}, bufnr)
  end

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  local servers = {
    -- clangd = {},
    -- gopls = {},
    pyright = {},
    rust_analyzer = {
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = {
          command = "clippy",
          allTargets = true,
        },
        completion = {
          autoimport = {
            enable = true,
          },
        },
        imports = {
          granularity = {
            group = "item",
          },
        },
        procMacro = {
          enable = true,
        },
        cargo = {
          features = "all",
        },
      },
    },
    tsserver = {},
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }


  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  local lspconfig = require('lspconfig')

  -- to prevent rust-analyzer from indexing external crates
  local function custom_root_dir_matcher(fname)
    local root_dir = lspconfig.util.root_pattern('.git')(fname)

    if root_dir and vim.fn.getcwd() == root_dir then
      return root_dir
    else
      return nil
    end
  end

  mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        root_dir = custom_root_dir_matcher,
      }
    end,
  }

  -- Scala Metals LSP configuration
  local metals_config = require('metals').bare_config()
  metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  }

  -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Debug settings if you're using nvim-dap
  -- local dap = require("dap")
  --
  -- dap.configurations.scala = {
  --   {
  --     type = "scala",
  --     request = "launch",
  --     name = "RunOrTest",
  --     metals = {
  --       runType = "runOrTestFile",
  --       --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
  --     },
  --   },
  --   {
  --     type = "scala",
  --     request = "launch",
  --     name = "Test Target",
  --     metals = {
  --       runType = "testTarget",
  --     },
  --   },
  -- }

  metals_config.on_attach = function(client, bufnr)
    -- require("metals").setup_dap()
    on_attach(client, bufnr)
  end

  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })

  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et

  -- Ctrl-S to save
  vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
  vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>gi', { silent = true })

  -- Alt-jkl; for window navigation
  vim.keymap.set('n', '<A-j>', '<C-w>j', { silent = true })
  vim.keymap.set('n', '<A-h>', '<C-w>h', { silent = true })
  vim.keymap.set('n', '<A-k>', '<C-w>k', { silent = true })
  vim.keymap.set('n', '<A-l>', '<C-w>l', { silent = true })

  vim.keymap.set('n', '<leader>vp', ':G push<CR>', { silent = true, desc = 'Push to git' })
  vim.keymap.set('n', '<leader>vu', ':G pull<CR>', { silent = true, desc = 'Pull from git' })
  vim.keymap.set('n', '<leader>vs', ':vertical G<CR>', { silent = true, desc = 'Git status' })

  -- unmap while getting use to new keyboard layout
  vim.keymap.set('n', 'H', '<Nop>', { silent = true })
  vim.keymap.set('n', 'L', '<Nop>', { silent = true })


  -------------------------------------------------------------------------------
  -- Cody via llmsp
  -------------------------------------------------------------------------------
  local configs = require "lspconfig.configs"
  if not configs.llmsp then
    configs.llmsp = {
      default_config = {
        cmd = { "llmsp" },
        filetypes = { "go", "rust" },
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end,
        settings = {},
      },
    }
  end

  lspconfig.llmsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      llmsp = {
        sourcegraph = {
          url = "https://sourcegraph.sourcegraph.com",
          accessToken = vim.env.SOURCEGRAPH_API_TOKEN,
          repos = { -- any repos you want context for
            "github.com/sourcegraph/sourcegraph",
            "github.com/ergoplatform/oracle-core",
          },
        },
      },
    },
  }

  vim.api.nvim_create_user_command("CodyR", function(command)
    local p = "file://" .. vim.fn.expand "%:p"

    for _, client in pairs(vim.lsp.get_active_clients { name = "llmsp" }) do
      client.request("workspace/executeCommand", {
        command = "cody",
        arguments = { p, command.line1 - 1, command.line2 - 1, command.args, true, true },
      }, function()
      end, 0)
    end
  end, { range = 2, nargs = 1 })

  vim.api.nvim_create_user_command("CodyC", function(command)
    local p = "file://" .. vim.fn.expand "%:p"

    for _, client in pairs(vim.lsp.get_active_clients { name = "llmsp" }) do
      client.request("workspace/executeCommand", {
        command = "cody",
        arguments = { p, command.line1 - 1, command.line2 - 1, command.args, false, true },
      }, function()
      end, 0)
    end
  end, { range = 2, nargs = 1 })

  vim.api.nvim_create_user_command("CodyE", function(command)
    local p = "file://" .. vim.fn.expand "%:p"

    for _, client in pairs(vim.lsp.get_active_clients { name = "llmsp" }) do
      client.request("workspace/executeCommand", {
        command = "cody.explain",
        arguments = { p, command.line1 - 1, command.line2 - 1, command.args },
      }, function(_, result, _, _)
        vim.lsp.util.open_floating_preview(result.message, "markdown", {
          height = #result.message,
          width = 80,
          focus_id = "codyResponse",
        })
        -- Call it again so that it focuses the window immediately
        vim.lsp.util.open_floating_preview(result.message, "markdown", {
          height = #result.message,
          width = 80,
          focus_id = "codyResponse",
        })
      end, 0)
    end
  end, { range = 2, nargs = 1 })
else
  -- undo/REDO via vscode
  -- https://github.com/vscode-neovim/vscode-neovim/issues/1139
  vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

  -- Commentary
  vim.keymap.set({ "x", "n", "o" }, "gc", "<Plug>VSCodeCommentary")
  vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine")

  vim.cmd([[
" gf/gF . Map to go to definition for now
nnoremap K <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap gh <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDeclaration')<CR>
"nnoremap gf <Cmd>call vscodeGoToDefinition('revealDeclaration')<CR>
"nnoremap gd <Cmd>call vscodeGoToDefinition('revealDefinition')<CR>
"nnoremap <C-]> <Cmd>call vscodeGoToDefinition('revealDefinition')<CR>
nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>
nnoremap gF <Cmd>call VSCodeNotify('editor.action.peekDeclaration')<CR>
nnoremap gD <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>

xnoremap K <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
xnoremap gh <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
"xnoremap gf <Cmd>call vscodeGoToDefinition('revealDeclaration')<CR>
xnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDeclaration')<CR>
"xnoremap <C-]> <Cmd>call vscodeGoToDefinition('revealDefinition')<CR>
xnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>
xnoremap gF <Cmd>call VSCodeNotify('editor.action.peekDeclaration')<CR>
xnoremap gD <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
xnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>

" <C-w> gf opens definition on the side
nnoremap <C-w>gf <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
xnoremap <C-w>gf <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
xnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
]])
end
