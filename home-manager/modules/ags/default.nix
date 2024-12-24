{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ./.;

    extraPackages = with pkgs; [
        inputs.ags.packages.${pkgs.system}.battery
        inputs.ags.packages.${pkgs.system}.apps
        inputs.ags.packages.${pkgs.system}.hyprland
        inputs.ags.packages.${pkgs.system}.mpris
        inputs.ags.packages.${pkgs.system}.wireplumber
        inputs.ags.packages.${pkgs.system}.tray
        inputs.ags.packages.${pkgs.system}.network
    ];

  };
}
