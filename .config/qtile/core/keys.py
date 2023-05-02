from libqtile.config import Key
from libqtile.lazy import lazy

from extras import float_to_front
from utils import config

browser = "firefox"
code = "code"
terminal = "wezterm"
music = "spotify"

keys, mod, alt = [], "mod4", "mod1"

for key in [
    # Switch between windows
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    # Move windows between columns
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Increase/decrease window size
    ([mod], "i", lazy.layout.grow()),
    ([mod], "m", lazy.layout.shrink()),
    (
        [mod, "control"],
        "Right",
        lazy.layout.grow(),
        lazy.layout.grow_right(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    (
        [mod, "control"],
        "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    (
        [mod, "control"],
        "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    (
        [mod, "control"],
        "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    # Window management
    ([mod, "shift"], "space", lazy.layout.flip()),
    # ([mod], "o", lazy.layout.maximize()),
    ([mod], "n", lazy.layout.normalize()),
    ([mod], "q", lazy.window.kill()),
    ([], "F11", lazy.window.toggle_fullscreen()),
    # Floating window management
    # ([mod], "space", lazy.window.toggle_floating()),
    # ([mod], "c", lazy.window.center()),
    # ([mod], "f", lazy.function(float_to_front)),
    # Toggle between layouts
    ([mod], "Tab", lazy.next_layout()),
    # Qtile management
    ([mod, "control"], "b", lazy.hide_show_bar()),
    # ([mod, "control"], "s", lazy.shutdown()),
    ([mod, "shift"], "r", lazy.reload_config()),
    ([mod, "shift"], "x", lazy.shutdown()),
    ([mod, alt], "r", lazy.restart()),
    # Kill X11 session
    ([mod, alt], "s", lazy.spawn("kill -9 -1")),
    # Terminal
    ([mod], "Return", lazy.spawn(terminal)),
    # ([mod, "shift"], "Return", lazy.spawn(terminal["floating"])),
    # Application Launcher
    # ([mod, "shift"], "r", lazy.spawn("rofi -show window")),
    ([mod], "o", lazy.spawn(f"launcher_t6")),
    ([mod], "x", lazy.spawn(f"powermenu_t6")),
    # Programs
    ([mod], "b", lazy.spawn(browser)),
    ([mod], "c", lazy.spawn(code)),
    ([mod], "s", lazy.spawn(music)),
    # Screenshot Tool
    ([], "Print", lazy.spawn("gnome-screenshot -i")),
    # Backlight
    ([mod], "XF86AudioLowerVolume", lazy.spawn("brightnessctl set 5%-")),
    ([mod], "XF86AudioRaiseVolume", lazy.spawn("brightnessctl set +5%")),
    # Volume
    ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
    # Player
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
]:
    keys.append(Key(*key))  # type: ignore
