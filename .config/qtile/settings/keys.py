from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

keys = [
    # SUPER + FUNCTION KEYS
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),

    # SUPER + SHIFT KEYS
    Key([mod, "shift"], "r", lazy.restart()),

    # CHANGE FOCUS
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

    # MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

    # TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # RUN ALACRITTY
    Key([mod], "Return", lazy.spawn('alacritty')),

    # RUN ROFI LAUNCHER
    Key([mod], "space", lazy.spawn('rofi -show drun')),

    # LAUNCH arandr
    Key([mod, "shift"], "a", lazy.spawn('arandr')),

    # SCREENSHOT
    Key([mod, "shift"], "s", lazy.spawn('gnome-screenshot -i')),

    # MULTIMEDIA
    Key([], "XF86AudioRaiseVolume", lazy.spawn('amixer set Master 5%+')),
    Key([], "XF86AudioLowerVolume", lazy.spawn('amixer set Master 5%-')),
    Key([], "XF86AudioMute", lazy.spawn('amixer -D pulse set Master 1+ toggle')),
    Key([], "XF86AudioPlay", lazy.spawn('playerctl play-pause')),
    Key([], "XF86AudioNext", lazy.spawn('playerctl next')),
    Key([], "XF86AudioPrev", lazy.spawn('playerctl prev')),
    Key([], "XF86AudioStop", lazy.spawn('playerctl stop')),
    Key([], "XF86MonBrightnessUp", lazy.spawn('xbacklight -inc 5')),
    Key([], "XF86MonBrightnessDown", lazy.spawn('xbacklight -dec 5')),

    # ARCOLINUX LOGOUT
    Key([mod], "x", lazy.spawn('archlinux-logout')),
    

]
