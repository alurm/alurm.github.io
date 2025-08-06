# Atom: https://www.ietf.org/rfc/rfc4287.txt
lib: components-of-posts: ''
  <?xml version="1.0" encoding="utf-8"?>

  <feed xmlns="http://www.w3.org/2005/Atom">
    <id>https://alurm.github.io</id>
    <title>Alan Urmancheev's blog posts</title>
    <author>
      <name>Alan Urmancheev</name>
    </author>

    <updated>
      ${((it: builtins.elemAt it (builtins.length it - 1)) components-of-posts).date}T00:00:000Z
    </updated>

    ${builtins.concatStringsSep "" (
      map (
        { date, rest }:
        let
          dir-name-of-post = builtins.concatStringsSep "-" [
            date
            rest
          ];
          dir-of-post = ./. + ("/" + dir-name-of-post);
          title = lib.escapeXML (builtins.readFile "${dir-of-post}/it.title");
          url-of-post = "https://alurm.github.io/blog/${dir-name-of-post}.html";
        in
        ''
          <entry>
            <title>${title}</title>
            <updated>${date}T00:00:00Z</updated>
            <link href="${url-of-post}"/>
            <content src="${url-of-post}">
            </content>
          </entry>
        ''
      ) components-of-posts
    )}

  </feed>
''
