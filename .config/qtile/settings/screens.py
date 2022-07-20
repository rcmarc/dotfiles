from os.path import join, dirname

from libqtile.config import Screen

from .widgets import bar_screen_1, bar_screen_2

def screen(bar, wall = 'wall.jpg'):
    return Screen(
        top=bar,
        wallpaper=join(dirname(dirname(__file__)), wall),
        wallpaper_mode='fill'
    )

screens = [
    screen(bar_screen_1),
    screen(bar_screen_2, 'wall1.jpg'),
]
