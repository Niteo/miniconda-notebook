CONDA=miniconda.sh

.PHONY:  clean notebook

OS := $(shell uname)
ifeq ($(OS), Linux)
 	URL := "https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh"
endif


$(CONDA):
	curl $(URL) -o $(CONDA) 
	chmod +x $(CONDA)

install: 
	./$(CONDA) -b -p ./miniconda
	./miniconda/bin/conda create --name notebook --file spec-file.txt
	
clean:
	rm -rf $(CONDA) miniconda