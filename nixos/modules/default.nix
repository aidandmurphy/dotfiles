{ inputs, pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./packages.nix

  ];
}
