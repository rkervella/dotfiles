# nix-env -i user-packages
{ pkgs }:
let
  vimrc = import ./vim/vimrc.nix { pkgs = pkgs; };
in
{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; rec {
    # Vim related stuff
    customVim = vim_configurable.customize {
      name = "vim";
        vimrcConfig = {
          customRC = vimrc.config;

            vam = {
              knownPlugins = pkgs.vimPlugins;
              pluginDictionaries = [
                 {
                   names = [
                     "vim-colorschemes"
                     "youcompleteme"
                     "ctrlp"
                     "vim-airline"
                     "vim-airline-themes"
                     "fugitive"
                     "vim-nix"
                     "vim-polyglot"
                   ];
                 }
                ];
            };
        };
    };
    # Custom packages
    userPackages = buildEnv {
      inherit ((import <nixpkgs/nixos> {}).config.system.path)
      pathsToLink ignoreCollisions postBuild;
      extraOutputsToInstall = [ "man" ];
      name = "user-packages";
      paths = [
        customVim
        tmux
        htop
        radare2
        radare2-cutter
        xorg.xbacklight
        xorg.xdpyinfo
        xfce.thunar
        tree
        zip
        unzip
        mitmproxy
        libyubikey
        yubico-piv-tool
        yubikey-manager
        yubikey-personalization
        virtmanager
        tdesktop
        jq
        go
        rustup
        gdb
        notify-osd
      ];
    };
  };
}
