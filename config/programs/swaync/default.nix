{ pkgs, config, lib, ... }:

{
   home.packages = with pkgs; [
       swaynotificationcenter
   ];

   xdg.configFile."swaync/config.json".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/programs/swaync/config.json";
}
