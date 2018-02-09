from libqtile.config import Screen, Drag, Click
from libqtile.command import lazy
from libqtile import bar, widget, hook
from keys import keys, groups
from layouts import layouts, floating_layout
from scratchpad import remove_scratchpadded, set_scratchpadded
from widgets import CryptoTicker

"""
This is main config file that should import all other config files and expose these variables:
    floating_layout groups keys
    layouts 
    mouse
    screens
    wmname
"""

mod = 'mod4'
import os

# defaults for widgets and extensions
widget_defaults = dict(font='sans', fontsize=16, padding=6)

extension_defaults = widget_defaults.copy()
bottom_bar_widgets = [
    widget.CurrentLayoutIcon(),
    widget.GroupBox(),
    CryptoTicker(currency='usd', from_currency='bitcoin', format='{to_price}:{percent_change_1h}|{percent_change_24h}%', update_interval=60),
    widget.Prompt(),
    widget.TaskList(rounded=False, margin_y=8, margin_x=1, padding_x=1),
    widget.Battery(),
    widget.Volume(),
    widget.Systray(),
    widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
]

screens = [
    Screen(bottom=bar.Bar(size=40, widgets=bottom_bar_widgets)),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
# for some java apps to work
wmname = "LG3D"


# startup apps
def wallpaper():
    os.system('feh --bg-scale ~/.wallpaper')


@hook.subscribe.startup
def autostart():
    wallpaper()


@hook.subscribe.client_new
def dialogs(window):
    if window.window.get_wm_type() == 'dialog' or window.window.get_wm_transient_for():
        window.floating = True
