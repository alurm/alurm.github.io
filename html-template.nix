{stylePath, mdPath}: ''
  <!doctype html>
  <html>
    <head>
      <link rel="stylesheet" href="${stylePath}"/>
      <meta name="viewport" content="width=device-width"/>
    </head>
    <body>
      $(pandoc -i ${mdPath})
    </body>
  </html>
''
  