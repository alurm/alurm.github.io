lib:
{
  style,
  post,
  title ? null,
  format ? "markdown",
}:
''
  <!doctype html>
  <html>
    <head>
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
            <meta
              name="twitter:title"
              content="Alan Urmancheev's site"
            />
            <meta
              name="twitter:description"
              content="${lib.escapeXML title}"
            />
            <title>$(cat ${title})</title>
          ''
        else
          ""
      }
    </head>
    <body>
      $(
        {
          ${
            if !isNull title then
              ''
                echo -n '# '
                cat ${title}
              ''
            else
              ""
          }
          cat ${post}
        } |
        pandoc --from=${format}
      )
    </body>
  </html>
''
