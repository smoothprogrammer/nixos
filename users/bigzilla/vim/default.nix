{ config, pkgs, ...}:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nerdtree
    ];
    settings = {
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
    extraConfig = ''
      " Start NERDTree when Vim is started without file arguments.
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
      " NERDTree show hidden file
      let NERDTreeShowHidden=1
      " NERDTree hide .swp extension
      let NERDTreeIgnore = ['\.swp$', '\.git$']
    '';
  };
}
