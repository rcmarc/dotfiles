import json
from os.path import join, dirname

theme_name = 'dracula'

def load_colors():
    with open(join(dirname(__file__), 'themes', f'{theme_name}.json')) as file:
        return json.load(file)

colors =  {x: [y, y] for x, y in load_colors().items()}
colored_icons_only = True

scale = 1.2

units = {
    'bar-size': int(26 * scale),
    'systray-icon-size': int(16 * scale),
    'group-font-size': int(16 * scale),
    'icon-font-size': int(16 * scale),
    'font-size': int(15 * scale),
}
