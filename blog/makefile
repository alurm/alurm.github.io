%.html: %.md ../style.css
	pandoc -i $< -o $@

.PHONY: default
default: $(patsubst %.md, %.html, $(wildcard *.md))
