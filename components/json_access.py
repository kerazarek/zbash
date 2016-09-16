#!/usr/bin/env python

### ACCESS ENTRIES FROM A JSON
  #
  # (c) Zarek Siegel
  # created 2016/09/16
  #

import sys
import json

def main():
	json_path = sys.argv[1]
	query = sys.argv[2:]
	# print(query)

	json_dict = json.load(open(json_path, 'r'))

	# print(json_dict)
	query_depth = len(query)
	# print(query_depth)

	output = json_dict
	for i in range(query_depth):
		key = query[i]
		output = output[key]

	print(str(output))




if __name__ == "__main__": main()
