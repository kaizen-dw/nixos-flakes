{ pkgs, ... }: {

  imports = [ ./settings ./pypr ./ecosystem ];

  wayland.windowManager.hyprland.enable = true;

  home = {
    sessionVariables = import ./variables.nix;
    packages = with pkgs; [
      wtype             # Input simulator
      mpvpaper          # Video wallpaper
      showmethekey

      # Might be useful but, I don't need it.
      # cliphist        # Clipboard Manager

      wl-mirror
      wl-gammarelay-rs
    ];
  };
}
