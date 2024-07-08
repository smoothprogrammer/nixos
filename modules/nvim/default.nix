{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.nvim;

  rest-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "rest-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "rest-nvim";
      repo = "rest.nvim";
      rev = "v1.0.1";
      sha256 = "sha256-u/N/gCVmeci3nMB/MbpgxkD41D4dS/sbomf+Vw9jBGw=";
    };
  };

  gopherjs = pkgs.buildGoModule rec {
    pname = "gopherjs";
    version = "v1.18.0-beta3";
    src = pkgs.fetchFromGitHub {
      owner = "gopherjs";
      repo = "gopherjs";
      rev = version;
      sha256 = "sha256-ktrGnC4xFaPMlOi4wa5XtBTVueKtWBGWKLCigefgYSY=";
    };
    vendorHash = "sha256-dJxghd+JVSn38IllrJfQfCvvgVxPvU/C2+yOMNJSuY8=";
    doCheck = false;
  };

  colorscheme = with pkgs.vimPlugins; [
    solarized-nvim
  ];

  treesitter = with pkgs.vimPlugins; [
    (nvim-treesitter.withPlugins (p: with p; [
      tree-sitter-nix
      tree-sitter-make
      tree-sitter-bash
      tree-sitter-dockerfile
      tree-sitter-go
      tree-sitter-dart
      tree-sitter-rust
      tree-sitter-c
      tree-sitter-cpp
      tree-sitter-java
      tree-sitter-lua
      tree-sitter-python
      tree-sitter-html
      tree-sitter-css
      tree-sitter-javascript
      tree-sitter-http
      tree-sitter-json
      tree-sitter-toml
      tree-sitter-yaml
      tree-sitter-markdown
    ]))
    nvim-treesitter-context
    playground
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
    nvim-coverage
    rest-nvim
  ];

  telescope = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-file-browser-nvim
    telescope-live-grep-args-nvim
    telescope-manix
    telescope-github-nvim
    telescope-dap-nvim
  ];

  ui = with pkgs.vimPlugins; [
    lualine-nvim
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
    oil-nvim
  ];
in
{
  options.conf.nvim.enable = lib.mkEnableOption "neovim";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
      fd
      curl
      jq
      tree-sitter
      gh
      editorconfig-checker
      gnumake
      gcc
      nixd
      nixfmt
      nixpkgs-fmt
      manix
      luajit
      lua-language-server
      go
      gopherjs
      gopls
      delve
      golangci-lint
      rustc
      cargo
      rustfmt
      rust-analyzer
      jdk17
      maven
      jdt-language-server
      flutter
      ast-grep
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
