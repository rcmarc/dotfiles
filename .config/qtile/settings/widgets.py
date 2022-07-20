import os

from libqtile import widget, bar

from .theme import colors, colored_icons_only, units


def base(**kwargs):
    fg = 'foreground'
    fontsize = kwargs.get('fontsize', units['font-size'])
    font = kwargs.get('font', 'UbuntuMono Nerd Font')
    if not kwargs.get('is_icon', False):
        fg = fg if colored_icons_only else kwargs.get('fg', fg)
    else:
        fontsize = kwargs.get('fontsize', units['icon-font-size'])
        fg = kwargs.get('fg', fg)

    return {
        'foreground': colors[fg],
        'background': colors['background'],
        'fontsize': fontsize,
        'font': font
    }


def icon(text, **kwargs):
    return widget.TextBox(
        text=text,
        padding=0,
        **base(is_icon=True, **kwargs),
    )


def sep():
    return widget.Sep(
        linewidth=1,
        padding=20,
        **base(),
    )


def ram(**kwargs):
    return [
        icon(' ', **kwargs),
        widget.Memory(**base(**kwargs))
    ]


def cpu(**kwargs):
    return [
        icon(' ', **kwargs),
        widget.CPU(
            format='{freq_current}GHz {load_percent}%',
            **base(**kwargs)
        ),
    ]


def brightness(**kwargs):
    backlight_name = os.listdir('/sys/class/backlight')[0]
    return [
        icon(' ', **kwargs),
        widget.Backlight(backlight_name=backlight_name, **base(**kwargs))
    ]


def volume(**kwargs):
    return [
        icon(' 墳 ', **kwargs),
        widget.Volume(**base(**kwargs))
    ]


def misc(**kwargs):
    return [
        *brightness(**kwargs),
        *volume(**kwargs),
    ]


def clock(**kwargs):
    return [
        icon(' ', **kwargs),
        widget.Clock(
            format=" %Y-%m-%d %H:%M",
            **base(fg='foreground' if colored_icons_only else kwargs.get('fg', None)),
        ),
    ]


def net(**kwargs):
    return [
        icon(' ', **kwargs),
        widget.Net(
            format="{down}  {up}  ",
            padding=0,
            **base(**kwargs)
        ),
    ]


def group_box():
    return widget.GroupBox(
        padding_x=10,
        active=colors['focus'],
        this_current_screen_border=colors['color3'],
        inactive=colors['inactive'],
        highlight_method='text',
        **base(fontsize=units['group-font-size']),
    )


def window_name():
    return widget.WindowName(
        **base(),
    )


def current_layout():
    return widget.CurrentLayout(
        **base(font='Noto Sans Bold'),
    )


def systray():
    return widget.Systray(
        icon_size=units['systray-icon-size'],
        padding=5,
    )


widget_defaults = {
    'fontsize': 14,
    'padding': 2,
    **base(),
}

extension_defaults = widget_defaults.copy()


def get_widgets():
    return [
        group_box(),
        sep(),
        current_layout(),
        sep(),
        window_name(),
        *misc(fg='color5'),
        sep(),
        *cpu(fg='color4'),
        sep(),
        *ram(fg='color3'),
        sep(),
        *net(fg='color2'),
        sep(),
        *clock(fg='color1'),
    ]


def get_bar(widgets=None):
    widgets = widgets or get_widgets()

    return bar.Bar(
        widgets=widgets,
        size=units['bar-size'],
        border_width=3,
        border_color=colors['background'][0],
    )


widgets_screen_1 = [*get_widgets(), sep(), systray()]

bar_screen_1 = get_bar(widgets_screen_1)
bar_screen_2 = get_bar()
