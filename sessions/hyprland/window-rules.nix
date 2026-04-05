{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    # ─────────────────────────────
    # Layer rules (OSD / overlays)
    # ─────────────────────────────
    layerrule = [
	"noanim, ^(volume_osd)$"
	"noanim, ^(brightness_osd)$"
	"noanim, hyprpicker"
	"noanim, qsdock"
	"blur, ext-session-lock"
	"ignorealpha 0.2, ext-session-lock"
    ];

    # ─────────────────────────────
    # Window rules
    # ─────────────────────────────
    windowrulev2 = [
      # ───────── CS2 ─────────
      "immediate, class:^(cs2)$"
      "keepaspectratio, class:^(cs2)$"

      # ───────── App Launcher ─────────
      "float, title:^(app-launcher)$"
      "center, title:^(app-launcher)$"
      "size 1200 600, title:^(app-launcher)$"
      "animation slide, title:^(app-launcher)$"

      # ───────── MASTER QUICKSHELL CONTAINER ─────────
      # All widgets now live inside this single, shape-shifting window.
      "float, title:^(qs-master)$"
      "pin, title:^(qs-master)$"
      "noshadow, title:^(qs-master)$"
      "noborder, title:^(qs-master)$"
      "noinitialfocus, title:^(qs-master)$"
      "move -5000 -5000, title:^(qs-master)$"
      
    ];
  };
}
