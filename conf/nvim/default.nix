{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.nvim;

  neotest-go = pkgs.vimUtils.buildVimPlugin {
    name = "neotest-go";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neotest";
      repo = "neotest-go";
      rev = "756edf3dddcb3b430110f9582e10b7e730428341";
      sha256 = "sha256-McofCzxPFksPqrT+Pka9syOgLLwYci3k1EQGx4JzjQ4=";
    };
  };

  colorscheme = with pkgs.vimPlugins; [
    nord-nvim
  ];

  treesitter = with pkgs.vimPlugins; [
    nvim-treesitter-context
    (nvim-treesitter.withPlugins (p: with p; [
      tree-sitter-nix
      tree-sitter-make
      tree-sitter-bash
      tree-sitter-dockerfile
      tree-sitter-go
      tree-sitter-rust
      tree-sitter-lua
      tree-sitter-python
      tree-sitter-html
      tree-sitter-css
      tree-sitter-javascript
      tree-sitter-json
      tree-sitter-toml
      tree-sitter-yaml
      tree-sitter-markdown
    ]))
  ];

  lsp = with pkgs.vimPlugins; [
    nvim-lspconfig
    neodev-nvim
    luasnip
    nvim-cmp
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp_luasnip
    cmp-path
  ];

  dap = with pkgs.vimPlugins; [
    nvim-dap
    nvim-dap-virtual-text
  ];

  test = with pkgs.vimPlugins; [
    neotest
    neotest-go
  ];

  telescope = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-file-browser-nvim
    telescope-manix
    telescope-github-nvim
    telescope-dap-nvim
  ];

  ui = with pkgs.vimPlugins; [
    lualine-nvim
    indent-blankline-nvim
    nvim-web-devicons
    nvim-colorizer-lua
  ];

  git = with pkgs.vimPlugins; [
    vim-fugitive
    gitsigns-nvim
    git-worktree-nvim
  ];

  misc = with pkgs.vimPlugins; [
    nerdcommenter
    editorconfig-nvim
    nvim-autopairs
    leap-nvim
    harpoon
  ];
in
{
  options.conf.nvim.enable = lib.mkEnableOption "neovim";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      tree-sitter
      gh
      editorconfig-checker
      gnumake
      gcc
      rnix-lsp
      manix
      luajit
      lua-language-server
      go
      gopls
      delve
      golangci-lint
    ];

    home-manager.sharedModules = [{
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        extraLuaConfig = builtins.readFile ./init.lua;
        plugins =
          colorscheme ++
          treesitter ++
          lsp ++
          dap ++
          test ++
          telescope ++
          ui ++
          git ++
          misc;
      };

      xdg.configFile = {
        "nvim/lua" = {
          recursive = true;
          source = ./lua;
        };
      };
    }];
  };
}
