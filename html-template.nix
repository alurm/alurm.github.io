{style, post}: ''
  <!doctype html>
  <html>
    <head>
      <link rel="stylesheet" href="${style}"/>
      <meta name="viewport" content="width=device-width"/>
      <meta charset="utf-8"/>
    </head>
    <body>
      $(pandoc ${post})
    </body>
  </html>
''
