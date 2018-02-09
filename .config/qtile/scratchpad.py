from libqtile import hook


def scratchpad(window):
    window.floating = True
    screen = window.group.screen

    window.tweak_float(
        x=int(screen.width / 4),
        y=int(screen.height / 4),
        w=int(screen.width / 2),
        h=int(screen.height / 2),
        )
    window.togroup('scratchpad')
    window.scratchpadded = True


def show_scratchpad(qtile):
    scratchpad = qtile.groupMap['scratchpad']
    last_window = (scratchpad.focusHistory[-1] if scratchpad.focusHistory else None)
    for w in list(qtile.currentGroup.windows):
        if w.scratchpadded:
            w.togroup('scratchpad')
    if last_window:
        last_window.togroup(qtile.currentGroup.name)


@hook.subscribe.setgroup
def remove_scratchpadded():
    previous_group = hook.qtile.currentScreen.previous_group
    if not previous_group:
        return
    for w in list(previous_group.windows):
        if w.scratchpadded:
            w.togroup('scratchpad')


@hook.subscribe.client_new
def set_scratchpadded(w):
    w.scratchpadded = False