-- curves
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })

-- animations
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "overshoot" })
hl.animation({ leaf = "windows", enabled = true, speed = 2, spring = "rubber", style = "slide" })
-- hl.curve("my_epic_bezier", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
