#!/usr/bin/env python

###
  #
  # (c) Zarek Siegel
  # created 2016/10/21
  #

import json, re
from sys import argv
from os import environ
from pathlib import Path
from csv import DictReader

def main():
	# this_script = sys.argv[0]
	# ZBASH_DIR = pathlib.Path(this_script).parent.parent
	# print(ZBASH_DIR)

# 	input = argv[1]

	pathz_csv_path = Path("/Users/zss2002/Dropbox/spreadsheets/pathz.csv")
	pathz = {}
	with pathz_csv_path.open('r') as pathz_csv:
		pathz_csv_reader = DictReader(pathz_csv)
		for row in pathz_csv_reader:
			pathz[row['name']] = row

	for name in pathz:
		# print(name, '\n\t', pathz[name], '\n')
		for key in pathz[name].keys():
			# substitute backticked things in paths
			eval_item_re = re.compile("^(?P<before>.*?)`(?P<backticked>.*?)`(?P<after>.*?)$")
			if re.match(r'^path.*$', key):
				if eval_item_re.match(pathz[name][key]):
					_before = eval_item_re.sub(r'\g<before>', pathz[name][key])
					_backticked = eval_item_re.sub(r'\g<backticked>', pathz[name][key])
					_after = eval_item_re.sub(r'\g<after>', pathz[name][key])
					if re.match(r'\$', _backticked):
						_backticked_name = [
							name for name in pathz \
								if _backticked == pathz[name]['envvar']
						][0]
					else:
						_backticked_name = [
							name for name in pathz \
								if _backticked in pathz[name]['shortcut']
						][0]
					_backticked_evald = pathz[_backticked_name][key]
					pathz[name][key] = _before + _backticked_evald + _after
			# create lists
			if ',' in pathz[name][key]:
				pathz[name][key] = pathz[name][key].split(',')
	# convert blanks to Nones
	for name in pathz:
		for key in pathz[name].keys():
			if pathz[name][key] == "":
				pathz[name][key] = None

	pathz_json_path = Path(str(pathz_csv_path) + ".json")
	with pathz_json_path.open('w') as pathz_json:
		json.dump(pathz, pathz_json)

	with pathz_json_path.open('r') as pathz_json:
		print(pathz_json.read())


# 	output = [ p for p in pathz.values() if p['shortcut'] == input ]
# 	try:
# 		output = output[0]
# 	except:
# 		output = None
# 	print(output)



if __name__ == "__main__": main()
