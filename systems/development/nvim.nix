{ config, pkgs, ... }:

{
	home-manager.sharedModules = [{
		programs.neovim = {
			enable = true;
			viAlias = true;
			vimAlias = true;
			extraConfig = ''
				luafile $HOME/.config/nvim/lua/settings.lua
				luafile $HOME/.config/nvim/lua/keybindings.lua
				luafile $HOME/.config/nvim/lua/plugins.lua
			'';
			plugins = with pkgs.vimPlugins; [
				# Theme
				dracula-vim

				# File tree
				nvim-web-devicons
				nvim-tree-lua

				# Utility
				telescope-nvim
				nerdcommenter
				lualine-nvim
				indent-blankline-nvim
				editorconfig-nvim
				nvim-autopairs
				vim-hexokinase

				# LSP
				nvim-lspconfig
				nvim-cmp

				# Treesitter
				(nvim-treesitter.withPlugins (
					plugins: with plugins; [
						tree-sitter-go
						tree-sitter-lua
						tree-sitter-nix
						tree-sitter-python
						tree-sitter-html
						tree-sitter-css
						tree-sitter-javascript
						tree-sitter-bash
						tree-sitter-make
						tree-sitter-dockerfile
						tree-sitter-json
						tree-sitter-toml
						tree-sitter-yaml
						tree-sitter-markdown
						tree-sitter-regex
					])
				)
			];
		};

		xdg.configFile = {
			"nvim/lua/settings.lua".source = ../config/nvim/lua/settings.lua;
			"nvim/lua/keybindings.lua".source = ../config/nvim/lua/keybindings.lua;
			"nvim/lua/plugins.lua".source = ../config/nvim/lua/plugins.lua;
		};
	}];
}
