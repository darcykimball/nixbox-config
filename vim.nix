{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    (vim_configurable.customize {
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix ];
        opt = [];
      };

      vimrcConfig.customRC = ''
        set nocompatible
        set ruler
        set ts=2
        set expandtab
        filetype on
        syntax on
        colorscheme industry
        set backspace=indent,eol,start
      '';
    })
  ];
}
