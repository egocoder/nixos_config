{
   wayland.windowManager.hyprland = {
     enable = true;
     systemd.enable = true;
     settings = {
       env = [
         "NIXOS_OZONE_WL,1"
	 "XDG_CURRENT_DESKTOP,Hyprland"
	 "XDG_SESSION_TYPE,wayland"
	 "XDG_SESSION_DESKTOP,Hyprland"
	 "QT_QPA_PLATFORM,wayland"
	 "XDG_SCREENSHOTS_DIR,$HOME/screens"
       ];

       monitor = ",1920x1080@180,auto,1";

       "$mainMod" = "SUPER";
       "$terminal" = "ghostty";
       "$fileManager" = "$terminal -e ranger";
       "$menu" = "wofi";

       exec-once = [
         "waybar"
         "wl-paste --type text --watch cliphist store"
         "wl-paste --type image --watch cliphist store"
	 "$terminal"
       ];

       general = {
         gaps_in = 0;
         gasp_out = 0;
         border_size = 5;
         "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
         "col.inactive_border" = "rgba(3c3836ff)";
	 resize_on_border = true;
	 allow_tearing = false;
	 layout = "master";
       };

       decoration  = {
         rounding = 0;
	 active_opacity = 1.0;
	 inactive_opacity = 1.0;
	 shadow.enable = false;
	 blur.enable = false;
       };

       animations.enable = false;

       input = {
         kb_layout = "br";
	 kb_variant = "abnt2";
	 kb_options = "";
       };

       gestures = {
         workspace_swipe = true;
	 workspace_swipe_invert = false;
	 workspace_swipe_forever = true;
       };

       dwindle = {
         pseudotile = true;
	 preserve_split = true;
       };

       master = {
         new_status = "slave";
	 new_on_top = true;
	 mfact = 0.5;
       };

       misc = {
         force_default_wallpaper = 0;
	 disable_hyprland_logo = true;
       };

       windowrulev2 = [
         "bordersize 0, floating:0,onworkspace:w[t1]"
	 "float, class:(mpv)|(imv)|(showmethekey-gtk)"
	 "move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
	 "noborder,nofocus,class:(showmehekey-gtk)"
	 "workspace 3,class:(obsidian)"
	 "workspace 3,class:(zathura)"
	 "workspace 4,class:(com.obsproject.Studio)"
	 "workspace 5,class:(telegram)"
	 "workspace 5,class:(vesktop)"
	 "workspace 6,class:(teams-for-linux)"
	 "suppressevent maximize,class:.*"

"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	 "opacity 0.0 override,class:^(xwaylandvideobridge)$"
	 "noanim,class:^(xwaylandvideobridge)$"
"noinitialfocus,class:^(xwaylandvideobridge)$"
	 "maxsize 1 1,class:^(xwaylandvideobridge)$"
	 "noblur,class:^(xwaylandvideobridge)$"
"nofocus,class:^(xwaylandvideobridge)$"
       ];

       workspace = [
         "w[tv1],gaspout:0,gaspin:0"
	 "f[1],gaspout:0,gaspin:0"
       ];
     };
   };
 }
