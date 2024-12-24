{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
