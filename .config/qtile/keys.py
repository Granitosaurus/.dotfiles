from libqtile.config import Key, Group, Screen, Drag, Click
from libqtile.command import lazy

mod = "mod4"
left, down, up, right = 'hjkl'


def backlight(action):
    def f(qtile):
        brightness = int(subprocess.run(['xbacklight', '-get'], stdout=subprocess.PIPE).stdout)
        if brightness != 1 or action != 'dec':
            if (brightness > 49 and action == 'dec') \
                                or (brightness > 39 and action == 'inc'):
                subprocess.run(['xbacklight', f'-{action}', '10',
                                '-fps', '10'])
            else:
                subprocess.run(['xbacklight', f'-{action}', '1'])
    return f


keys = [
    # Switch between windows in current stack pane
    Key([mod], left, lazy.layout.left()),
    Key([mod], up, lazy.layout.up()),
    Key([mod], down, lazy.layout.down()),
    Key([mod], right, lazy.layout.right()),
    # Move windows up or down in current layout
    Key([mod, "shift"], up, lazy.layout.shuffle_up()),
    Key([mod, "shift"], down, lazy.layout.shuffle_down()),
    Key([mod, "shift"], left, lazy.layout.swap_left()),
    Key([mod, "shift"], right, lazy.layout.swap_right()),
    # Window sizing
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    #Key([mod, "shift"], up, lazy.window.resize_floating(0, 5, 0, 0)),
    #Key([mod, "shift"], down, lazy.window.resize_floating(0, -5, 0, 0)),
    #Key([mod, "shift"], left, lazy.window.resize_floating(5, 0, 0, 0)),
    #Key([mod, "shift"], right, lazy.window.resize_floating(-5, 0, 0, 0)),
    # Key([mod, "shift"], "o", lazy.window.down_opacity()), 
    # Key([mod, "shift"], "p", lazy.window.up_opacity()),

    Key([mod], "space", lazy.window.toggle_floating()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("terminator")),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "d", lazy.spawncmd()),

    # Laptop keys
    Key([], 'XF86MonBrightnessUp',   lazy.spawn('xbacklight -inc 10')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('xbacklight -dec 10')),
    Key([], 'XF86AudioMute', lazy.spawn('pactl set-sink-mute @DEFAULT_SOURCE@ toggle')),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ +2%')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ -2%')),

]

groups = [Group(i) for i in "1234567890"]
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])


