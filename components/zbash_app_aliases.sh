#!/usr/bin/env bash

### app (binary) aliases
  #
  # (c) Zarek Siegel
  # created 10/10/16 11:39
  #


if uname -s | grep -q 'Darwin'; then

	alias pymol='/Applications/PyMOLX11Hybrid.app/Contents/MacOS/MacPyMOL'

	alias vmd='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86'
	alias vmdt='/Applications/VMD\ 1.9.2.app/Contents/vmd/vmd_MACOSXX86 -dispdev text -eofexit'

fi
