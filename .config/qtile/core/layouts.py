from libqtile import layout
from libqtile.config import Match

from utils import color

# Tiling

config = {
    "border_focus": color["magenta"],
    "border_normal": color["bg"],
    "border_width": 2,
    "margin": 2,
    "margin_on_single": 10,
    "border_on_single": True,
}

layouts = [
    layout.Columns(
        **config,
        change_ratio=0.02,
        min_ratio=0.30,
        max_ratio=0.70,
    ),
]

# ---- Floating -------------------------- #
floating_layout = layout.Floating(
    border_focus=color["white"],
    border_normal=color["bg"],
    border_width=0,
    fullscreen_border_width=0,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(
            wm_class=[
                "confirmreset",
                "gnome-screenshot",
                "lxappearance",
                "makebranch",
                "maketag",
                "psterm",
                "ssh-askpass",
                "thunar",
                "Xephyr",
                "xfce4-about",
                "wm",
            ]
        ),  # type: ignore
        Match(
            title=[
                "branchdialog",
                "File Operation Progress",
                "minecraft-launcher",
                "Open File",
                "pinentry",
                "wm",
            ]
        ),  # type: ignore
    ],
)
