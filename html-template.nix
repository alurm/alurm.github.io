{
  pandoc,
  lib,
}:
{
  style,
  content,
  need-table-of-contents,
  title ? null,
  format ? "markdown",
}:
assert lib.assertMsg (lib.typeOf style == "string") "the stylesheet can't point to the Nix store";
assert lib.assertMsg ((!isNull title || need-table-of-contents) -> format == "markdown") "need-table-of-contents and title require markdown format";
assert lib.assertMsg (need-table-of-contents -> !isNull title) "need-table-of-contents requires a title to be set";
''
  <!doctype html>
  <html>
    <head>
      <link
        rel="alternate"
        type="application/atom+xml"
        title="Atom feed for Alan Urmancheev's blog"
      />
      <link rel="stylesheet" href="${style}"/>
      <meta name="viewport" content="width=device-width"/>
      <meta charset="utf-8"/>
      ${
        if !isNull title then
          # Not sure how bad is it to escape HTML with lib.escapeXML.
          # `jq --raw-{input,output} @html` could be used here instead.
          # But consider this:
          # nix-repl> lib.escapeXML "'<>&\""
          # "&apos;&lt;&gt;&amp;&quot;"
          ''
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:title" content="Alan Urmancheev's site"/>
            <meta name="twitter:description" content="${lib.escapeXML title}"/>
            <title>${lib.escapeXML title}</title>
          ''
        else
          ""
      }
    </head>
    <body>
      $(
        ${
          if format == "markdown" then
            ''
              {
                ${
                  lib.optionalString (!isNull title) ''
                    printf '# %s\n' ${lib.escapeShellArg title}
                  ''
                }
                ${
                  lib.optionalString need-table-of-contents ''
                    printf '## Table of contents\n'
                  ''
                }
                cat ${content} | ${pandoc}/bin/pandoc --from ${format} --to markdown \
                  ${
                    lib.optionalString need-table-of-contents
                    "--toc --standalone"
                  }
              } |
              ${pandoc}/bin/pandoc --from markdown
            ''
          else
            ''
              cat ${content} |
              ${pandoc}/bin/pandoc --from ${format}
            ''
        }
      )
    </body>
  </html>
''
