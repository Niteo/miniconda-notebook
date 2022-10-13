CONDA=miniconda.sh

.PHONY:  clean notebook

OS := $(shell uname)
ifeq ($(OS), Linux)
 	URL := "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
else ifeq ($(OS), Darwin)
 	URL := "https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
endif

$(CONDA):
	curl $(URL) -L -o $(CONDA) 
	chmod +x $(CONDA)

install: 
	./$(CONDA) -b -p ./miniconda
	./miniconda/bin/conda env create --file environment.yml
	
clean:
	rm -rf $(CONDA) miniconda
