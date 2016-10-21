#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/10/17
  #

import argparse
import re

global specchars
specchars = {
	'mu': b'\xce\xbc',
	'sup_0': b'\xe2\x81\xb0',
	'sup_1': b'\xc2\xb9',
	'sup_2': b'\xc2\xb2',
	'sup_3': b'\xc2\xb3',
	'sup_4': b'\xe2\x81\xb4',
	'sup_5': b'\xe2\x81\xb5',
	'sup_6': b'\xe2\x81\xb6',
	'sup_7': b'\xe2\x81\xb7',
	'sup_8': b'\xe2\x81\xb8',
	'sup_9': b'\xe2\x81\xb9',
	'sup_minus': b'\xe2\x81\xbb',
	'mult': b'\xc3\x97'
}

for char in specchars:
	specchars[char] = specchars[char].decode()

global si_prefixes
si_prefixes = [
	{'prefix_long': 'exa', 'prefix_short': 'E', 'power': 18},
	{'prefix_long': 'peta', 'prefix_short': 'P', 'power': 15},
	{'prefix_long': 'tera', 'prefix_short': 'T', 'power': 12},
	{'prefix_long': 'giga', 'prefix_short': 'G', 'power': 9},
	{'prefix_long': 'mega', 'prefix_short': 'M', 'power': 6},
	{'prefix_long': 'kilo', 'prefix_short': 'k', 'power': 3},
	{'prefix_long': '', 'prefix_short': '', 'power': 0},
	{'prefix_long': 'milli', 'prefix_short': 'm', 'power': -3},
	{'prefix_long': 'micro', 'prefix_short': specchars['mu'], 'power': -6},
	{'prefix_long': 'nano', 'prefix_short': 'n', 'power': -9},
	{'prefix_long': 'pico', 'prefix_short': 'p', 'power': -12},
	{'prefix_long': 'femto', 'prefix_short': 'f', 'power': -15},
	{'prefix_long': 'atto', 'prefix_short': 'a', 'power': -18}
]

class Number:
	def __str__(self):
		return self.output

	def __init__(self, input_number, output_format='si', unit=None, pad='', sig_sfs=1, frac_sfs=3):
		self.input_number = input_number
		self.output_format = output_format
		self.unit = unit
		self.pad = pad
		self.sig_sfs = sig_sfs
		self.frac_sfs = frac_sfs

		self.float = float(self.input_number)
		self.enot_str = "{:+e}".format(self.float)
		enot_regex_str = r'^(?P<significand>(?P<sig_whole>[+-]?\d)\.(?P<sig_fractional>\d+))e(?P<exp>[+-]?\d+)$'
		enot_regex = re.compile(enot_regex_str)
		self.significand = enot_regex.sub(r'\g<significand>', self.enot_str)
		self.significand = float(self.significand)
		self.sig_whole = enot_regex.sub(r'\g<sig_whole>', self.enot_str)
		self.sig_whole = int(self.sig_whole)
		self.sig_fractional = enot_regex.sub(r'\g<sig_fractional>', self.enot_str)
		self.sig_fractional = int(self.sig_fractional)
		self.exp = enot_regex.sub(r'\g<exp>', self.enot_str)
		self.exp = int(self.exp)

		# print(self.float)
		# print(self.enot_str)
		# print(self.sig_whole)
		# print(self.sig_fractional)
		# print(self.exp)

		for s in si_prefixes:
			power = s['power']
			if self.exp >= power:
				self.si_power = power
				self.si_prefix = s['prefix_short']
				self.si_prefix_long = s['prefix_long']
				self.si_sig = self.float / (10 ** self.si_power)
				break

		# print(self.si_power)
		# print(self.si_prefix)
		# print(self.si_prefix_long)
		# print(self.si_sig)

		if self.output_format in ['f', 'fl', 'float']:
			self.output = str(self.float)

		elif self.output_format in ['sci', 'fancy', 'scifancy']:
			sup_power = ''
			for char in str(self.exp):
				if char == '-':
					sup_power += specchars['sup_minus']
				else:
					sup_power += specchars["sup_{}".format(char)]

			self.output = "{sig:{pad}{sig_sfs}.{frac_sfs}} {times} 10{sup_power}".format(
				sig = self.significand,
				pad = self.pad,
				sig_sfs = self.sig_sfs,
				frac_sfs = self.frac_sfs,
				times = specchars['mult'],
				sup_power = sup_power
			)
			if self.unit is not None:
				self.output += " " + self.unit

		elif self.output_format in ['si', 'si_long']:
			self.output = "{sig:{pad}{sig_sfs}.{frac_sfs}f}".format(
				sig = self.si_sig,
				pad = self.pad,
				sig_sfs = self.sig_sfs,
				frac_sfs = self.frac_sfs
			)

			if self.unit is None:
				self.unit = 'u'
			if self.output_format == 'si_long':
				prefix = self.si_prefix_long
			else:
				prefix = self.si_prefix
			self.output += " {}{}".format(prefix, self.unit)



def main():

	parser = argparse.ArgumentParser(
		description="pynum.py - pretty formatting of number with SI units")

	parser.add_argument('-n', '--number', metavar='NUM', type=str, nargs=1, required=True,
		action='store', help='...')
	parser.add_argument('-o', '--out-format', metavar='FMT', type=str, nargs='?', default='si',
		action='store', help='...')
	parser.add_argument('-u', '--unit', metavar='UNIT', type=str, nargs='?', default=None,
		action='store', help='...')
	parser.add_argument('-p', '--pad', metavar='UNIT', type=str, nargs='?', default='',
		action='store', help='padding character (default \'\')')
	parser.add_argument('-s', '--sig-sfs', metavar='NUM', type=int, nargs='?', default=1,
		action='store', help='...')
	parser.add_argument('-f', '--frac-sfs', metavar='NUM', type=int, nargs='?', default=3,
		action='store', help='...')
	parser.add_argument('-F', '--print-formats', action='store_true', default=False,
		help='...')

	args = parser.parse_args()

	# print(args)

	n = Number(
		input_number = args.number[0],
		output_format = args.out_format,
		unit = args.unit,
		pad = args.pad,
		sig_sfs = args.sig_sfs,
		frac_sfs = args.frac_sfs
	)

	print(n)



if __name__ == "__main__": main()
