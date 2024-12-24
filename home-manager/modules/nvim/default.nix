{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      dofile('/home/aidan/nix/home-manager/modules/nvim/init.lua')
    '';
  };
}
