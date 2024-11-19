#!/usr/bin/env python3
import os
import random

potential_wallpapers = os.listdir("/home/blackstar/.wallpapers/")
wpp = potential_wallpapers[random.randint(0, len(potential_wallpapers) - 1)]
os.system(f"hyprctl hyprpaper wallpaper 'eDP-1,/home/blackstar/.wallpapers/{wpp}'")
