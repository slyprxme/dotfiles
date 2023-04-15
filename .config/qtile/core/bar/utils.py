from libqtile import widget
from extras import PowerLineDecoration, RectDecoration

defaults = {
    "font": "SauceCodePro Nerd Font Bold",
    "fontsize": 13,
    "padding": None,
}


def base(bg: str, fg: str) -> dict:
    return {
        "background": bg,
        "foreground": fg,
    }


def decoration(side: str = "") -> dict:
    return {
        "decorations": [
            RectDecoration(
                filled=True,
                radius={"left": [8, 0, 0, 8], "right": [0, 8, 8, 0]}.get(side, 8),
                use_widget_background=True,
            )
        ]
    }


def iconFont(size=17) -> dict:
    return {
        "font": "CaskaydiaCove Nerd Font Bold",
        "fontsize": size,
    }


def powerline(path: str | list, size=5) -> dict:
    return {
        "decorations": [
            PowerLineDecoration(
                path=path,
                size=size,
            )
        ]
    }
