from __future__ import division, print_function

import importlib
import traceback


modules = {
	'matplotlib' : 'mpl',
	'matplotlib.pyplot' : 'plt',
	'numpy' : 'np',
	'seaborn' : 'sns',
	'vigra' : ''
	}

for k,v in modules.items():
	try:
		globals()[k if v == '' else v]  = importlib.import_module(k)
	except ImportError as e:
		print("Could not load module " + k)
		traceback.print_exc()
