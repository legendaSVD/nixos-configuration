{ config, pkgs, ... }: 

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";

    gesture = [
      "3, horizontal, workspace"
    ];
    
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    
    binde = [
      "$mainMod&SHIFT_L, left, resizeactive,-50 0"
      "$mainMod&SHIFT_L, right, resizeactive,50 0"
      "$mainMod&SHIFT_L, up, resizeactive,0 -50"
      "$mainMod&SHIFT_L, down, resizeactive,0 50"
    ];
      
    bindl = [
      "ALT_L, SHIFT_L, exec, hyprctl switchxkblayout main prev"
      "SHIFT_L, ALT_L, exec, hyprctl switchxkblayout main next"
      
      ", Caps_Lock, exec, sleep 0.1 && swayosd-client --caps-lock"

      "$mainMod, SPACE, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", xf86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ", xf86audiomute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ", Print, exec, ~/.config/hypr/scripts/screenshot.sh"
      "SHIFT_L, Print, exec, ~/.config/hypr/scripts/screenshot.sh --edit"
      
      ", XF86PowerOff, exec, bash ~/.config/hypr/scripts/lock.sh"
    ];
    
    bindel = [
      ", xf86audiolowervolume, exec, swayosd-client --output-volume lower"
      ", xf86audioraisevolume, exec, swayosd-client --output-volume raise"
      
      "$mainMod, L, exec, bash ~/.config/hypr/scripts/lock.sh" 
			 
    ];
    
    bind = [    
      "$mainMod, D, exec, bash ~/.config/hypr/scripts/rofi_show.sh drun"
      "ALT, TAB, exec, bash ~/.config/hypr/scripts/rofi_show.sh window"
      "$mainMod, C, exec, bash ~/.config/hypr/scripts/rofi_clipboard.sh"
      "$mainMod, M, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle monitors"
      "$mainMod, A, exec, swaync-client -t -sw"
      "$mainMod&SHIFT_L, F, togglefloating,"

      # Quickshell windows
      "$mainMod&SHIFT_L, S, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle stewart"
      "$mainMod, Q, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle music"
      "$mainMod, B, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle battery"
      "$mainMod, W, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle wallpaper"
      "$mainMod, S, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle calendar"
      "$mainMod, N, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle network"
      "$mainMod&SHIFT_L, T, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle focustime"
      "$mainMod, V, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle volume"
      "$mainMod, H, exec, bash ~/.config/hypr/scripts/qs_manager.sh toggle guide"

      "$mainMod, F, exec, firefox"
      "$mainMod, E, exec, nautilus"
      "$mainMod, T, exec, Telegram"
      "$mainMod, O, exec, obsidian"
      "$mainMod, RETURN, exec, $terminal"

      "ALT, F4, exec, bash -c 'if hyprctl activewindow | grep -q \"title: qs-master\"; then ~/.config/hypr/scripts/qs_manager.sh close; else hyprctl dispatch killactive; fi'"

      "$mainMod&CTRL, left, movewindow, l"
      "$mainMod&CTRL, right, movewindow, r"
      "$mainMod&CTRL, up, movewindow, u"
      "$mainMod&CTRL, down, movewindow, d"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, 1, exec, ~/.config/hypr/scripts/qs_manager.sh 1"
      "$mainMod, 2, exec, ~/.config/hypr/scripts/qs_manager.sh 2"
      "$mainMod, 3, exec, ~/.config/hypr/scripts/qs_manager.sh 3"
      "$mainMod, 4, exec, ~/.config/hypr/scripts/qs_manager.sh 4"
      "$mainMod, 5, exec, ~/.config/hypr/scripts/qs_manager.sh 5"
      "$mainMod, 6, exec, ~/.config/hypr/scripts/qs_manager.sh 6"
      "$mainMod, 7, exec, ~/.config/hypr/scripts/qs_manager.sh 7"
      "$mainMod, 8, exec, ~/.config/hypr/scripts/qs_manager.sh 8"
      "$mainMod, 9, exec, ~/.config/hypr/scripts/qs_manager.sh 9"
      "$mainMod, 0, exec, ~/.config/hypr/scripts/qs_manager.sh 10"

      "$mainMod SHIFT, 1, exec, ~/.config/hypr/scripts/qs_manager.sh 1 move"
      "$mainMod SHIFT, 2, exec, ~/.config/hypr/scripts/qs_manager.sh 2 move"
      "$mainMod SHIFT, 3, exec, ~/.config/hypr/scripts/qs_manager.sh 3 move"
      "$mainMod SHIFT, 4, exec, ~/.config/hypr/scripts/qs_manager.sh 4 move"
      "$mainMod SHIFT, 5, exec, ~/.config/hypr/scripts/qs_manager.sh 5 move"
      "$mainMod SHIFT, 6, exec, ~/.config/hypr/scripts/qs_manager.sh 6 move"
      "$mainMod SHIFT, 7, exec, ~/.config/hypr/scripts/qs_manager.sh 7 move"
      "$mainMod SHIFT, 8, exec, ~/.config/hypr/scripts/qs_manager.sh 8 move"
      "$mainMod SHIFT, 9, exec, ~/.config/hypr/scripts/qs_manager.sh 9 move"
      "$mainMod SHIFT, 0, exec, ~/.config/hypr/scripts/qs_manager.sh 10 move"
     ]; 
  };
}
