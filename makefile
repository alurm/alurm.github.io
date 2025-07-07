.DEFAULT_GOAL := all

%.html: %.md
	pandoc -i $< -o $@

.PHONY: all
all: $(patsubst %.md, %.html, $(wildcard *.md))
	cd resume && make
	cd blog && make

.PHONY: clean
clean:
	rm -f index.html
	cd resume && make clean
	cd blog && make clean
