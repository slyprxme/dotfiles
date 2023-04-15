from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from core import bar
from core.keys import keys, mod

# Icons & Tags
groups, tag = [], bar.tags

# Workspaces
for g in (
    ("1", tag[0], None, []),
    ("2", tag[1], "max", [Match(wm_class="Mozilla Firefox")]),
    ("3", tag[2], "max", [Match(wm_class="code")]),
    ("4", tag[3], "max", [Match(wm_class="discord")]),
    ("w", tag[4], None, []),
    ("e", tag[5], "max", []),
):
    args = {"label": g[1], "layout": g[2], "matches": g[3]}
    groups.append(Group(name=g[0], **args))

# Key Bindings
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen(toggle=True)),
            # mod1 + shift + letter of group = move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )


# for i in groups:
#     keys.extend(
#         [
#             Key(
#                 [mod],
#                 i.name,
#                 lazy.group[i.name].toscreen(),
#                 desc="Mod + number to move to that group.",
#             ),
#             Key(["mod1"], "Tab", lazy.screen.next_group(), desc="Move to next group."),
#             Key(
#                 ["mod1", "shift"],
#                 "Tab",
#                 lazy.screen.prev_group(),
#                 desc="Move to previous group.",
#             ),
#             Key(
#                 [mod, "shift"],
#                 i.name,
#                 lazy.window.togroup(i.name),
#                 desc="Move focused window to new group.",
#             ),
#         ]
#     )
