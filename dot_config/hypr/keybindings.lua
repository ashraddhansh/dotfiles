local terminal = "kitty"
local network = "kitty -e nvim"
local tmux = "kitty -e tmux"
local notes = "obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland"
local fileManager = "nautilus -w"
local browser = "zen-browser"
local browserTwo = "firefox --new-window"
local clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
local menu = "if pgrep -x rofi >/dev/null; then pkill -x rofi; else rofi -show drun; fi"
local partialScreenshot = "hyprshot -m region -o $HOME/Pictures/Screenshots/"
local fullScreenshot = "hyprshot -m window -o $HOME/Pictures/Screenshots/"
local prtSc = "hyprshot -m output -o $HOME/Pictures/Screenshots/"

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(tmux))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd(network))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browserTwo))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + DELETE", hl.dsp.exit())

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client - -sw"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("kitty -e btop"))

hl.bind(mainMod .. " + apostrophe", hl.dsp.window.close())
-- closeWindowBind:set_enabled(true)

hl.bind(mainMod .. " + comma", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + Return", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Audio Control
hl.bind("F7", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("F8", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
hl.bind("F11", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("F12", hl.dsp.exec_cmd("pamixer -i 5"))

-- Brightness Control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(" hyprctl hyprsunset gamma +10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(" hyprctl hyprsunset gamma -10"), { locked = true, repeating = true })

hl.bind("F10", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("F9", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media Control
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.window.cycle_next({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.window.cycle_next({ direction = "right" }))

-- special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Screenshot
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(fullScreenshot))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(partialScreenshot))
hl.bind("PRINT", hl.dsp.exec_cmd(prtSc))

-- swap with master
hl.bind("code:156", hl.dsp.layout("rollnext"))
