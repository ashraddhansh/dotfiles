-- █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
-- █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
	mirror = "eDP-1",
})

-- █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
-- █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("swaync")
	hl.exec_cmd("kitty -e tmux")
	hl.exec_cmd("zen-browser")
	hl.exec_cmd("nautilus")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- █▀▀ █▄░█ █░█
-- ██▄ █░▀█ ▀▄▀

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND", " direct")

-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█
hl.config({
	master = {
		mfact = 0.50,
		new_status = "master",
		orientation = "right",
	},
})

hl.config({
	misc = {
		initial_workspace_tracking = 0,
		disable_splash_rendering = true,
		focus_on_activate = true,
	},
})

hl.config({
	input = {
		kb_layout = "us,us",
		kb_variant = "dvorak,basic",
		kb_options = "caps:swapescape,grp:win_space_toggle",
		repeat_rate = 70,
		repeat_delay = 400,
		sensitivity = 0.5,
		scroll_method = "2fg",
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.config({
	binds = {
		workspace_back_and_forth = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

require("keybindings")
require("nvidia")
require("theme")
require("windowrule")
require("animations")
