{pkgs, ...}: {
  # Call dbus-update-activation-environment on login
  services.xserver.updateDbusEnvironment = true;

  # Enables support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable Bluetooth support
  services.blueman.enable = true;

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    portalPackage =
      pkgs.xdg-desktop-portal-wlr
      // {
        override = args: pkgs.xdg-desktop-portal-wlr.override (builtins.removeAttrs args ["hyprland"]);
      };
  };

  # Enable security services
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services = {
    hyprlock = {};
    gdm.enableGnomeKeyring = true;
  };

  # Enable Ozone Wayland support in Chromium and Electron based applications
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Yaru";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # List of Hyprland specific packages
  environment.systemPackages = with pkgs; [
    file-roller # archive manager
    gnome-calculator
    gnome-pomodoro
    gnome-text-editor
    loupe # image viewer
    nautilus # file manager
    seahorse # keyring manager
    totem # Video player

    brightnessctl
    grim
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    libnotify
    networkmanagerapplet
    pamixer
    slurp
    swappy
    tesseract
    wf-recorder
    wlr-randr
    wlsunset
  ];
}
