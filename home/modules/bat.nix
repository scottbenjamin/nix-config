{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # List of packages installed for the user
  home.packages = with pkgs; [
    bat
  ];

  # Environment session variables
  home.sessionVariables = {
    BAT_THEME = "Catppuccin-macchiato";
  };
}
