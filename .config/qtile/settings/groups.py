from libqtile.config import Group, Key
from libqtile.command import lazy

from .keys import keys, mod

groups = []
group_labels = ["", "", "", "", "" ]

for index, label in enumerate(group_labels):
    groups.append(
        Group(
            name=str(index + 1),
            label=label,
        )
    )

for i in groups:
    keys.extend([
        # CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        # MOVE WINDOW TO SELECTED WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])
