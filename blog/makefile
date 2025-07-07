.DEFAULT_GOAL := all

%.html: %.md
	pandoc -i $< -o $@

.PHONY: all
all: $(patsubst %.md, %.html, $(wildcard *.md))

.PHONY: clean
clean:
	rm -f *.html
