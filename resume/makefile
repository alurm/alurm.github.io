.DEFAULT_GOAL := all

MAKEFLAGS := --no-builtin-rules

.PHONY : all
all : alan-urmancheev-russian.pdf alan-urmancheev-english.pdf

alan-urmancheev-%.pdf : alan-urmancheev-%.html
	`# Suggestion: open $< in a private window in Firefox and save that as $@`
	false

# Pandoc is not used for converting from markdown to PDF directly since on my current (circa 2024) system it requires pdflatex and I don't have that installed on my laptop.
alan-urmancheev-%.html : alan-urmancheev-%.md
	pandoc -i $< -o $@
