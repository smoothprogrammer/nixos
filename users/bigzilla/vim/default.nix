{ config, pkgs, ...}:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      editorconfig-vim
      nerdcommenter
      nerdtree
      nerdtree-git-plugin
      vim-airline
      vim-css-color
      vim-devicons
      vim-gitgutter
      vim-nerdtree-syntax-highlight
      vim-nix
    ];
    settings = {
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
    extraConfig = ''
      " Start NERDTree when Vim is started without file arguments.
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter *
      \ if argc() == 0 && !exists('s:std_in') |
      \   NERDTree |
      \ elseif argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \   execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] |
      \ endif
      " NERDTree automatic delete buffer
      let NERDTreeAutoDeleteBuffer = 1
      " NERDTree show hidden file
      let NERDTreeShowHidden = 1
      " NERDTree hide .swp extension
      let NERDTreeIgnore = ['\.swp$', '\.git$']
    '';
  };
}
