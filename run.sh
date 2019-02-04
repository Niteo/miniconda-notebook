#!/bin/bash

if [ ! -d miniconda ]; then
	make
	make install
fi

source miniconda/bin/activate notebook
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter notebook
