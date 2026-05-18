hl.config({
	general = {
		layout = "master",
		gaps_in = 4,
		gaps_out = 8,
		border_size = 2,
		col = {

			active_border = { colors = { "rgba(ca9ee6ff)", "rgba(f2d5cfff)" }, angle = 45 },
			inactive_border = { colors = { "rgba(b4befecc)", "rgba(6c7086cc)" }, angle = 45 },
		},
	},
})

hl.config({
	decoration = {
		rounding = 10,
		blur = {
			enabled = true,
			size = 20,
			passes = 3,
			special = true,
		},
	},
})
