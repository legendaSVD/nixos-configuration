{config, ... }:

{
   wayland.windowManager.hyprland.settings = {
      "exec-once" = [
	 "swww-daemon"
	 "hypridle"
	 "playerctld"
	 "wl-paste --type text --watch cliphist store" 
	 "wl-paste --type image --watch cliphist store"
	 "systemctl --user enable --now easyeffects"
	 "${./scripts/volume_listener.sh}"
	 "gsettings set org.gnome.desktop.interface cursor-theme 'ArcMidnight-Cursors'"
	 "gsettings set org.gnome.desktop.interface cursor-size 24"
	 "quickshell -p ~/.config/hypr/scripts/quickshell/Main.qml"
	 "quickshell -p ~/.config/hypr/scripts/quickshell/TopBar.qml"
	 "python3 ~/.config/hypr/scripts/quickshell/focustime/focus_daemon.py &"	
      ];
   };
}
