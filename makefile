.DEFAULT_GOAL := default

%.html: %.md
	pandoc -i $< -o $@

.PHONY: default
default: $(patsubst %.md, %.html, $(wildcard *.md))
	cd resume && make
	cd blog && make
