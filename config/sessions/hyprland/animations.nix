{ lib, config, ... }:

{
   wayland.windowManager.hyprland.settings = {
      animations = {
        enabled = "yes";
        bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
        animation = [
          # Windows pop in instead of sliding
          "windows, 1, 5, myBezier, popin 80%"
          "windowsOut, 1, 5, myBezier, popin 80%"
          
          # Layers (rofi, waybar) set to fade to remove the up/down slide
          "layers, 1, 5, myBezier, fade"
          "layersIn, 1, 5, myBezier, fade"
          "layersOut, 1, 5, myBezier, fade"
          
          "fade, 1, 5, myBezier"
          
          # Workspaces slide horizontally (standard)
          "workspaces, 1, 5, myBezier, slide"
          
          # Special workspaces fade to avoid the vertical slide
          "specialWorkspaceIn, 1, 5, myBezier, fade"
          "specialWorkspaceOut, 1, 5, myBezier, fade"
        ];
      };   };
}
