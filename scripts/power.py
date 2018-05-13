#! /usr/bin/env python

import sys
import subprocess

actions = {"Log Out": ["bspc", "quit"],
        "Shutdown": "poweroff",
        "Restart": "reboot"}

def execute(action):
    if action in actions.keys():
        subprocess.Popen(actions[action])

def print_menu():
    for k in actions.keys():
        print(k)


if __name__ == '__main__':
    if len(sys.argv) == 1:
        print_menu()
    else:
        execute(sys.argv[1])
