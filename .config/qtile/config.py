import os
import re
import socket
import subprocess
from typing import List
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook 
from libqtile.utils import guess_terminal

mod = "mod4"
#terminal = guess_terminal()
terminal = 'alacritty'

keys = [
    # Essentials
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "g",
        lazy.spawn('rofi -show run -lines 5 -eh 2 -width 100 -padding 500 -opacity "80" -bw 0 -bc "$base01" -bg "$base02" -fg "$base07" -hlbg "$base05" -columns 2 -font "Inconsolata Nerd Font 14" -hlfg "#9575cd"'),
        desc='Run Launcher'),
    # Switch between windows in current stack pane
    Key([mod], "n", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "e", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack all the way
    Key([mod, "control"], "n", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "e", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]

group_names = [("WWW",'6', {'layout': 'monadtall'}),
               ("DEV",'7', {'layout': 'monadtall'}),
               ("SYS",'8', {'layout': 'monadtall'}),
               ("CHAT",'9', {'layout': 'monadtall'}),
               ("MUS",'0', {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name,_,kwargs in group_names]

for i, (name, keybinding, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], keybinding, lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], keybinding, lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 2,
                "margin": 12,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }
                
layouts = [
    layout.MonadWide(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Stack(stacks=2, **layout_theme),
    layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.TreeTab(
         font = "Inconsolata Nerd Font",
         fontsize = 13,
         sections = ["FIRST", "SECOND"],
         section_fontsize = 15,
         bg_color = "141414",
         active_bg = "90C435",
         active_fg = "000000",
         inactive_bg = "384323",
         inactive_fg = "a0a0a0",
         padding_y = 10,
         section_top = 15,
         panel_width = 320
         ),
    layout.Floating(**layout_theme)
]

widget_defaults = dict(
    font='Inconsolata Nerd Font',
    fontsize=16,
    padding=10,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("Test config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.QuickExit(),
            ],
            24,
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
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
