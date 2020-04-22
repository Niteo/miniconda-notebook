CONDA=miniconda.sh

.PHONY:  clean notebook

OS := $(shell uname)
ifeq ($(OS), Linux)
 	URL := "https://repo.continuum.io/miniconda/Miniconda2-4.5.12-Linux-x86_64.sh"
else ifeq ($(OS), Darwin)
 	URL := "https://repo.continuum.io/miniconda/Miniconda2-4.5.12-MacOSX-x86_64.sh"
endif

$(CONDA):
	curl $(URL) -L -o $(CONDA) 
	chmod +x $(CONDA)

install: 
	./$(CONDA) -b -p ./miniconda
	./miniconda/bin/conda env create --file environment.yml
	
clean:
	rm -rf $(CONDA) miniconda
