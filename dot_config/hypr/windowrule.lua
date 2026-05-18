-- auto open windows

hl.window_rule({
	name = "kitty tmux",
	match = { class = "kitty", title = "tmux" },
	workspace = "2 silent",
})

hl.window_rule({
	name = "zen browser",
	match = { class = "zen-browser" },
	workspace = "1 silent",
})

hl.window_rule({
	name = "nautilus",
	match = { class = "org.gnome.Nautilus" },
	workspace = "3 silent",
})

hl.window_rule({
	name = "obsidian",
	match = { class = "obsidian" },
	workspace = "4 silent",
})

-- opacity rules
hl.window_rule({
	name = "kitty-opacity",
	match = { class = "kitty" },
	opacity = "0.8",
})

-- hl.window_rule({
-- 	name = "zen opacity",
-- 	match = { class = "zen" },
-- 	opacity = "0.8",
-- })

-- hl.window_rule({
-- 	name = "nautilus-opacity",
-- 	match = { class = "org.gnome.Nautilus" },
-- 	opacity = "0.8",
-- })

hl.window_rule({
	name = "calender-opacity",
	match = { class = "org.gnome.Calendar" },
	opacity = "0.8",
})

hl.window_rule({
	name = "obsidian-opacity",
	match = { class = "obsidian" },
	opacity = "0.8",
})

hl.window_rule({
	name = "zathura-opacity",
	match = { class = "org.pwmt.zathura" },
	opacity = "0.8",
})

hl.window_rule({
	name = "org.freedesktop.impl.portal.desktop.gtk",
	match = { class = "org.freedesktop.impl.portal.desktop.gtk" },
	opacity = "0.8",
})

hl.window_rule({
	name = "org.freedesktop.impl.portal.desktop.hyprland",
	match = { class = "org.freedesktop.impl.portal.desktop.hyprland" },
	opacity = "0.8",
})

-- floating rules
hl.window_rule({
	name = "xdg-desktop-portal-gtk-float",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
})

hl.window_rule({
	name = "nautilus-sushi-float",
	match = { class = "org.gnome.NautilusPreviewer" },
	float = true,
})

hl.window_rule({
	name = "localsend-float",
	match = { class = "localsend" },
	float = true,
})

hl.window_rule({
	name = "pavucontrol-float-opacity",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	opacity = "0.8",
})

hl.window_rule({
	name = "blueman-float-opacity",
	match = { class = "blueman-manager" },
	float = true,
	opacity = "0.8",
})

-- Zen Browser Save Menu
hl.window_rule({
	name = "zen-move-and-size",
	match = { class = "zen-alpha", title = " Save Image" },
	float = true,
	move = { 705, 210 },
	size = { 540, 720 },
})
