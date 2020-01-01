"""Get random twitch emotes to your clipboard"""

# TODO
# Fetch emotes from the web


import argparse
import os
import sys
import pyperclip  # https://github.com/asweigart/pyperclip
from random import randint, choice


def parse_emotes(file, number):
    with open(file, 'r') as f:
        list_of_emotes = f.readlines()
        pyperclip.copy(' '.join([choice(list_of_emotes).strip() for i in range(number)]))  # copy emotes to clipboard


parser = argparse.ArgumentParser(usage='[options]')
parser.add_argument('-n', type=int, help='Specify number of emotes to load')
parser.add_argument('--main', action='store_true', help='Load global emotes')
parser.add_argument('--extra', action='store_true', help='Load frankerZ emotes')

if len(sys.argv) < 2:
    parser.print_help()
    sys.exit()
args = parser.parse_args()
if args.n is None:  # if the num of emotes is not specified, choose a random num btn 1, 10
    n = randint(1, 10)
else:
    n = args.n

os.chdir(os.path.dirname(sys.argv[0]))
if args.main:
    parse_emotes('twitch_emotes.txt', n)  # global emotes
if args.extra:
    parse_emotes('frankerz_emotes.txt', n)  # top used FrankerZ emotes --> https://www.frankerfacez.com/emoticons/?q=&sort=count-desc
