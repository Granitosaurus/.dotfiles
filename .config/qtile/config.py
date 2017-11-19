from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from keys import keys, mod, groups
from layouts import layouts, floating_layout

widget_defaults = dict(
    font='sans',
    fontsize=24,
    padding=6,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.CurrentLayoutIcon(),
                widget.Prompt(),
                widget.WindowTabs(),
                widget.Battery(),
                widget.Volume(),
                #widget.BitcoinTicker(format="--`BTC: {avg}", source_currency='btc', currency='usd'),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
            ],
            40,
        ),
    ),
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

if __name__ == "__main__":
    print(keys)
