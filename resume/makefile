.DEFAULT_GOAL := all

MAKEFLAGS := --no-builtin-rules

.PHONY: all
all: alan-urmancheev.pdf alan-urmancheev.html

# PDF.

alan-urmancheev.pdf: alan-urmancheev.typ
	typst compile $< $@

# HTML. It's tempting to use Typst directly for this, but currently Pandoc works just as fine.

header.html: ../style.css

alan-urmancheev-base.html: alan-urmancheev.typ
	pandoc --from typst --to html $< -o $@

alan-urmancheev.html: header.html alan-urmancheev-base.html
	cat $^ > $@
