{style, post, title ? null, format ? "markdown"}: ''
  <!doctype html>
  <html>
    <head>
      <link rel="stylesheet" href="${style}"/>
      <meta name="viewport" content="width=device-width"/>
      <meta charset="utf-8"/>
      ${
        if !isNull title then ''
          <title>$(cat ${title})</title>
        '' else ""
      }
    </head>
    <body>
      $(
        {
          ${
            if !isNull title then ''
              echo -n '# '
              cat ${title}
            '' else ""
          }
          cat ${post}
        } |
        pandoc --from=${format}
      )
    </body>
  </html>
''
