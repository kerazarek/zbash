#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/10/17
  #

import datetime, argparse, re
from pathlib import Path

def print_var(var_str):
	var = eval(var_str)
	print("{:<8} = {}".format(var_str, var))

def path_type(p):
	if p.is_dir(): return 'dir'
	elif p.is_symlink(): return 'symlink'
	elif p.is_block_device(): return 'block_device'
	elif p.is_char_device(): return 'char_device'
	elif p.is_fifo(): return 'fifo'
	elif p.is_socket(): return 'socket'
	elif p.is_file(): return 'file'
	else: return '??'

def size(p):
	if type(p) is str:
		p = Path(p)
	if p.is_dir():
		p_size = 0
		p_children = p.rglob('*')
		#print(list(p_children))
		for child in p_children:
			if child.is_dir():
				pass
			else:
				child_size = child.stat().st_size
				p_size += child_size
				# print('\t', child, child_size, p_size )

	else:
		p_size = p.stat().st_size
	return p_size


def analyze_dir(d_str):
	data = {}
	data['path'] = d_str

	print("{:<8} = {}".format("d_str", d_str))

	d = Path(d_str)
	if d.exists():
		print(">>> dir {} exists!".format(d))
	else:
		print("!!! directory {} does not exist, exiting".format(d))
		exit(1)

	d = d.resolve()
	data['abspath'] = str(d)

	d_contents = d.rglob('*')
	data['contents'] = [ c for c in d.glob('*') ]

	print("{:<8} = {}".format("d", d))
	print("data:")
	_colwidth = max([len(k) for k in data]) + 1
# 	for k, v in data.items():
# 		print("{sp:4}{k:<{w}}= '{v}'".format(sp="", k=k, w=_colwidth, v=v))

	print(size(d))



def main():
	# PARSING ARGUMENTS
	parser = argparse.ArgumentParser(
		description="pydu.py - like du, but not")

	parser.add_argument('-d', '--dir', metavar='DIR', type=str, nargs='*',
	 	default=[], action='store', help='directories to query')

	# parser.add_argument('-t', '--text', metavar='TEXT', type=str, nargs='*',
	# 	action='append', help='text to format\n')
	# parser.add_argument('-n', '--no-newline', action='store_true', default=False,
	# 	help='don\'t add a newline character to the end of the text')
	# parser.add_argument('-c', '--clear', metavar='N', type=int, nargs='?', default=2,
	# 	action='store', help='clear: 0 for beginning, 1 for end, -1 for neither, 2 for both (default)')
	# parser.add_argument('-C', '--no-clear', action='store_true', default=False,
	# 	help='don\'t clear formatting at beginning or end')
	# parser.add_argument('-f', '--fgcolor', metavar='COL', type=str, nargs='?',
	# 	action='store', help='colorcode for foreground (text color) [integer in (0,255), names color, or d/def/default]')
	# parser.add_argument('-b', '--bgcolor', metavar='COL', type=str, nargs='?',
	# 	action='store', help='colorcode for background (highlight) [integer in (0,255), names color, or d/def/default]')
	# parser.add_argument('-o', '--bold', action='store_true', default=False,
	# 	help='make text bold')
	# parser.add_argument('-d', '--dim', action='store_true', default=False,
	# 	help='make text dim')
	# parser.add_argument('-u', '--underlined', action='store_true', default=False,
	# 	help='make text underlined')
	# parser.add_argument('-U', '--not-underlined', action='store_true', default=False,
	# 	help='make text not underlined')
	# parser.add_argument('-v', '--reversed', action='store_true', default=False,
	# 	help='reverse text coloring (background/foreground)')
	# parser.add_argument('-l', '--blink', action='store_true', default=False,
	# 	help='make text blinking')
	# parser.add_argument('-i', '--invisible', action='store_true', default=False,
	# 	help='make text invisible')
	# parser.add_argument('-r', '--raw', action='store_true', default=False,
	# 	help='few raw input string for text coloring')
	# parser.add_argument('-N', '--namespace', action='store_true', default=False,
	# 	help='print the argparse Namespace')
	# parser.add_argument('-P', '--print-colors', action='store_true', default=False,
	# 	help='print out all named colors')
	# parser.add_argument('-A', '--all-colors', action='store_true', default=False,
	# 	help='print out all named colors')

	# raw arguents is a tuple consisting of
	#	the successfully parsed arguments by argparse as a Namespace object,
	#	followed by the unparsed ones in a list
	raw_args = parser.parse_known_args()
	args = [ arg for arg in raw_args if type(arg) is argparse.Namespace ][0]
	argv = [ arg for arg in raw_args if type(arg) is list ][0]

	# append any unknown arguments to args.dir
	for arg in argv:
		args.dir.append(arg)

	# if no dir arguments given, default is '.'
	if len(args.dir) == 0:
		args.dir.append('.')

	print("{:<16} = {}".format("args", args))
	for path_str in args.dir:
		analyze_dir(path_str)




if __name__ == "__main__": main()
