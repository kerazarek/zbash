#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/10/17
  #

import argparse
import re

class Number:

	def __init__(self, input_number, input_format=None, output_format='si', unit='u'):
		self.input_number = input_number
		self.input_format = input_format
		self.output_format = output_format
		self.unit = unit

		# if self.input_format is None:
		#	self.parse_format()

		self.float = float(self.input_number)
		print(self.float)
		self.enot_str = "{:+e}".format(self.float)
		print(self.enot_str)
		# enot_regex_str = r'^(?P<sign>+|-)(?P<sig_whole>\d)\.(?P<sig_frac>\d+)e(?P<exp_sign>+|-)(?P<exp>\d+)$'
		enot_regex_str = r'^(?P<sig_sign>[+-])(?P<sig_whole>\d)\.(?P<sig_fractional>\d+)e(?P<exp_sign>[+-])(?P<exp>\d+)$'
		print(enot_regex_str)
		enot_regex = re.compile(enot_regex_str)
		print(enot_regex)
		self.sig_sign = enot_regex.sub(r'\g<sig_sign>', self.enot_str)
		print(self.sig_sign)
		self.sig_whole = enot_regex.sub(r'\g<sig_whole>', self.enot_str)
		self.sig_whole = int(self.sig_whole)
		print(self.sig_whole)
		self.sig_fractional = enot_regex.sub(r'\g<sig_fractional>', self.enot_str)
		self.sig_fractional = int(self.sig_fractional)
		print(self.sig_fractional)
		self.exp_sign = enot_regex.sub(r'\g<exp_sign>', self.enot_str)
		print(self.exp_sign)
		self.exp = enot_regex.sub(r'\g<exp>', self.enot_str)
		self.exp = int(self.exp)
		print(self.exp)




def main():

	parser = argparse.ArgumentParser(
		description="pynum.py - pretty formatting of number with SI units")

	parser.add_argument('-n', '--number', metavar='NUM', type=str, nargs=1, required=True,
		action='store', help='...')
	parser.add_argument('-i', '--in-format', metavar='FMT', type=str, nargs='?', default=None,
		action='store', help='...')
	parser.add_argument('-o', '--out-format', metavar='FMT', type=str, nargs='?', default='si',
		action='store', help='...')
	parser.add_argument('-u', '--unit', metavar='UNIT', type=str, nargs='?', default='u',
		action='store', help='...')
	parser.add_argument('-f', '--print-formats', action='store_true', default=False,
		help='...')

	args = parser.parse_args()

	print(args)

	n = Number(
		input_number = args.number[0],
		input_format = args.in_format,
		output_format = args.out_format,
		unit = args.unit
	)




if __name__ == "__main__": main()
