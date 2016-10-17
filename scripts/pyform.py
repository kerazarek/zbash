#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/10/12
  #

import argparse, re, collections

global formatting_strings
formatting_strings = {
	"fgcolor" : "\033[38;5;{color}m",
	"bgcolor" : "\033[48;5;{color}m",
	"bold" : "\033[1m",
	"smul" : "\033[4m",
	"rmul" : "\033[24m",
	"rev" : "\033[7m",
	"blink" : "\033[5m",
	"invis" : "\033[8m",
	"smso" : "\033[7m",
	"rmso" : "\033[27m",
	"sgr0" : "\033(B\033[m",
}

global color_names
color_names = collections.OrderedDict([
	("magenta", 201),
	("darkred", 88),
	("orange", 208),
	("yellow", 226),
	("brightgreen", 46),
	("dullgreen", 2),
	("cyan", 51),
])

class Formatted:

	def add_clear_before(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["sgr0"],
			self.formatted_text
		)
		return self

	def add_clear_after(self):
		self.formatted_text = "{}{}".format(
			self.formatted_text,
			formatting_strings["sgr0"]
		)
		return self

	def add_fgcolor(self, colorcode):
		if type(colorcode) is str:
			colorcode = color_names[colorcode]
		self.formatted_text = "{}{}".format(
			formatting_strings["fgcolor"].format(
				color = colorcode
			),
			self.formatted_text
		)
		return self

	def add_bgcolor(self, colorcode):
		if type(colorcode) is str:
			colorcode = color_names[colorcode]
		self.formatted_text = "{}{}".format(
			formatting_strings["bgcolor"].format(
				color = colorcode
			),
			self.formatted_text
		)
		return self

	def add_bold(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["bold"],
			self.formatted_text
		)
		return self

	def add_underlined(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["smul"],
			self.formatted_text
		)
		return self

	def add_not_underlined(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["rmul"],
			self.formatted_text
		)
		return self

	def add_reversed(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["rev"],
			self.formatted_text
		)
		return self

	def add_blink(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["blink"],
			self.formatted_text
		)
		return self

	def add_invisible(self):
		self.formatted_text = "{}{}".format(
			formatting_strings["invis"],
			self.formatted_text
		)
		return self

	def raw(self):
		if self.clear_before: self.add_clear_before()
		if self.clear_after: self.add_clear_after()

		self.formatted_text = repr(self.formatted_text)
		return self

	def apply_attributes(self):
		if hasattr(self, "fgcolor"):
			 self.add_fgcolor(self.fgcolor)
		if hasattr(self, "bgcolor"):
			 self.add_bgcolor(self.bgcolor)
		if hasattr(self, "bold") and self.bold is True:
			 self.add_bold()
		if hasattr(self, "underlined") and self.underlined is True:
			 self.add_underlined()
		if hasattr(self, "not_underlined") and self.not_underlined is True:
			 self.add_not_underlined()
		if hasattr(self, "reversed") and self.reversed is True:
			 self.add_reversed()
		if hasattr(self, "blink") and self.blink is True:
			 self.add_blink()
		if hasattr(self, "invisible") and self.invisible is True:
			 self.add_invisible()

	def __str__(self):
		if self.clear_before: self.add_clear_before()
		if self.clear_after: self.add_clear_after()

		if hasattr(self, "raw") and self.raw is True:
			 self.raw()

		self.output = self.formatted_text
		return self.output

	def __repr__(self):
		if self.clear_before: self.add_clear_before()
		if self.clear_after: self.add_clear_after()

		self.output = self.formatted_text
		return repr(self.output)

	def print(self):
		if self.clear_before: self.add_clear_before()
		if self.clear_after: self.add_clear_after()

		if hasattr(self, "raw") and self.raw is True:
			 self.raw()

		self.output = self.formatted_text
		print(self.output)

	def __init__(self, text="", *args, **kwargs):
		self.input_text = text
		self.formatted_text = text

		# Converted supplied arguments to attributes
		self.properties = {}
		for arg in args:
			self.properties[arg] = True
		for k, v in kwargs.items():
			self.properties[k] = v
		for k, v in self.properties.items():
			setattr(self, str(k), v)

		# Some duplicate names just in case
		if hasattr(self, "c"):
			self.clear = self.c
		if hasattr(self, "clear"):
			self.clear_before = self.clear
			self.clear_after = self.clear
		if hasattr(self, "preclear"):
			self.clear_before = self.preclear
		if hasattr(self, "postclear"):
			self.postclear = self.postclear
		if hasattr(self, "color"):
			self.fgcolor = self.color
		if hasattr(self, "fg"):
			self.fgcolor = self.fg
		if hasattr(self, "f"):
			self.fgcolor = self.f
		if hasattr(self, "bg"):
			self.bgcolor = self.bg
		if hasattr(self, "b"):
			self.bgcolor = self.b
		if hasattr(self, "ul"):
			self.underlined = self.ul
		if hasattr(self, "rev"):
			self.reversed = self.rev
		if hasattr(self, "invis"):
			self.invisible = self.invis

		# By default, DON'T clear formatting before and after
		if not hasattr(self, "clear_before"):
			self.clear_before = False
		if not hasattr(self, "clear_after"):
			self.clear_after = False

		# Apply supplied attributes
		self.apply_attributes()

def main():
	if False:
		f = Formatted("testing")
		print("hi")
		f0 = Formatted("zero")
		f1 = Formatted("one").add_fgcolor(1)
		f1a = Formatted("one").add_fgcolor(1).add_fgcolor("orange")
		f1b = Formatted("one").add_fgcolor("orange").add_fgcolor(1)
		f2 = Formatted("two").add_fgcolor("orange").add_bold()
		f3 = Formatted("three").add_fgcolor(1).add_bgcolor(2).raw()
		f4 = Formatted("four", fg=100)
		print(f0)
		print(f1)
		print(f1a)
		print(f1b)
		print(f2)
		print(f3)
		print(f4)
		for col in ["magenta", "darkred", "orange", "yellow", "brightgreen", "dullgreen", "cyan"]:
			print(Formatted("text: {}".format(col), bold=True, fg=col))
			print(Formatted("text: {}".format(col), bold=True, fg=col))

	# PARSING ARGUMENTS
	parser = argparse.ArgumentParser(
		description="zbash_formatting.py - generate formatted text for the CLI")

	parser.add_argument('-t', '--text', metavar='TEXT', type=str, nargs='*',
		action='append', help='text to format')
	parser.add_argument('-c', '--clear', metavar='N', type=int, nargs='?',
		action='store', help='clear: 0 for beginning, 1 for end, -1 for neither, 2 for both (default)')
	parser.add_argument('-C', '--no_clear', action='store_true', default=False,
		help='***')
	parser.add_argument('-f', '--fgcolor', metavar='COL', type=str, nargs='?',
		action='store', help='colorcode for foreground (text color)')
	parser.add_argument('-b', '--bgcolor', metavar='COL', type=str, nargs='?',
		action='store', help='colorcode for background (highlight)')
	parser.add_argument('-o', '--bold', action='store_true', default=False,
		help='***')
	parser.add_argument('-u', '--underlined', action='store_true', default=False,
		help='***')
	parser.add_argument('-U', '--not_underlined', action='store_true', default=False,
		help='***')
	parser.add_argument('-v', '--reversed', action='store_true', default=False,
		help='***')
	parser.add_argument('-l', '--blink', action='store_true', default=False,
		help='***')
	parser.add_argument('-i', '--invisible', action='store_true', default=False,
		help='***')
	parser.add_argument('-r', '--raw', action='store_true', default=False,
		help='***')
	parser.add_argument('-N', '--namespace', action='store_true', default=False,
		help='print the argparse Namespace')
	parser.add_argument('-P', '--print_colors', action='store_true', default=False,
		help='***')

	args = parser.parse_args()

	# coerce text list into string
	args.text_str = ""
	if args.text is not None:
		# flatten the text list if -t given multiple times
		args.text = sum(args.text, [])
		for item in args.text:
			args.text_str += item + " "
		# clip final space
		args.text_str = re.sub(r' $', r'', args.text_str)

	try: args.fgcolor = int(args.fgcolor)
	except (ValueError, TypeError): pass

	try: args.bgcolor = int(args.bgcolor)
	except (ValueError, TypeError): pass

	# create Formatted object
	f = Formatted(text = args.text_str)
	if args.fgcolor is not None: f.add_fgcolor(args.fgcolor)
	if args.bgcolor is not None: f.add_bgcolor(args.bgcolor)
	if args.bold: f.add_bold()
	if args.underlined: f.add_underlined()
	if args.not_underlined: f.add_not_underlined()
	if args.reversed: f.add_reversed()
	if args.blink: f.add_blink()
	if args.invisible: f.add_invisible()
	if args.raw: f.raw()
	if args.no_clear: args.clear = -1
	if args.clear is None or args.clear == 2:
		f.add_clear_before()
		f.add_clear_after()
	elif args.clear == 0:
		f.add_clear_before()
	elif args.clear == 1:
		f.add_clear_after()

	# PRINT
	if args.namespace: print(args)
	if args.print_colors:
		for color in color_names:
			ff = Formatted(text="{:<12}".format(color), clear_before=True, fgcolor=color, bold=True)
			fff = Formatted(text="({})".format(color_names[color]),
				fgcolor=16, bgcolor=color, clear_after=True)
			print("{} {}".format(ff, fff))
	if args.text is not None: print(f)



if __name__ == "__main__": main()

################################################################################

# tput:
	# Capname	Description
	# bold	Start bold text
	# smul	Start underlined text
	# rmul	End underlined text
	# rev	Start reverse video
	# blink	Start blinking text
	# invis	Start invisible text
	# smso	Start "standout" mode
	# rmso	End "standout" mode
	# sgr0	Turn off all attributes

	# for f in bold smul rmul rev blink invis smso rmso sgr0; do echo $f; printf "%q\n" $(tput $f); done
	# bold
	# $'\E[1m'
	# smul
	# $'\E[4m'
	# rmul
	# $'\E[24m'
	# rev
	# $'\E[7m'
	# blink
	# $'\E[5m'
	# invis
	# $'\E[8m'
	# smso
	# $'\E[7m'
	# rmso
	# $'\E[27m'
	# sgr0
	# $'\E(B\E[m'

	# bold
	# \033[1m
	# smul
	# \033[4m
	# rmul
	# \033[24m
	# rev
	# \033[7m
	# blink
	# \033[5m
	# invis
	# \033[8m
	# smso
	# \033[7m
	# rmso
	# \033[27m
	# sgr0
	# \033(B\033[m
