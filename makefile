%.html: %.md
	nix run nixpkgs#md4c -- $^ -o $@

.PHONY: default
default: $(patsubst %.md, %.html, $(wildcard *.md))
