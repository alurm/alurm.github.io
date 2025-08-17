// #context {
//   if target() == "html" {
//     html.elem("head")[
//       #html.elem("style", "* { font-size: 10 }")
//     ]
//   }
// }

#show link: it => underline(text(blue, it))
#show heading.where(level: 1): it => align(center, it)
#show heading.where(level: 2): it => align(center, it)

= Alan Urmancheev: software engineer, systems programmer, open source contributor, public speaker

#link("mailto:alan.urman@gmail.com")
#link("https://github.com/alurm")[GitHub]
#link("https://t.me/alurm")[Telegram]

== Technical skills

*Programming languages*: Rust, C, Go.

*Technologies*: Linux, Git, Docker, Nix, GNU Make, Bash.

*Languages*: advanced English, native Russian.

*Secondary skills*: C++, Haskell, SQL, computer networking, systems administration.

== Notable projects

=== #link("https://github.com/alurm/json2dir")[`json2dir`]: a JSON-to-directory converter (Rust, Nix, 100+ stars on GitHub)

`json2dir` is used as a *fast alternative to home-manager* for managing dotfiles.

=== #link("https://github.com/alurm/alush")[`alush`]: a Unix shell with closures, hashmaps and a custom garbage collector (Rust, Nix)

`alush` ia a Unix shell with closures and hashmaps, capable of passing around structured data, which is usually cumbersome in shells like Bash. A custom cycle collecting GC has been implemented.

=== #link("https://github.com/alurm/JSON")[`JSON`]: a plugin for the Acme text editor for viewing JSON (Go)

`JSON` is a plugin for the Acme text editor which represents JSON objects and arrays as individual windows, making in convenient to interactively explore large JSON values. #link("https://youtube.com/shorts/kqXfiNjZgaM")[Video].

=== #link("https://github.com/alurm/42-ping")[`42-ping`]: an implementation of the ping networking utility (C23)

`42-ping` is a tool that sends ICMP packets to report on availability of internet hosts.

=== #link("https://github.com/alurm/irc")[`irc`]: an IRC server (C++)

`irc` is an implementation of the client-server part of the original IRC specification.

== Public speaking

Have a *technology focused blog* (#link("https://alurm.github.io/#blog")[web], #link("https://t.me/alurman")[Telegram]). *Have given public talks* (about Git, C (#link("https://youtube.com/watch?v=BzqpjE7lgxw")[1], #link("https://youtube.com/watch?v=TJBGWVVmSNE")[2]), Nix (#link("https://youtube.com/watch?v=noEbul27dHE")[1]), and other topics).

== Open source contributions

#{
  let content = (
    [#link("https://github.com/ki-editor/ki-editor")[`ki-editor`] (#link("https://github.com/ki-editor/ki-editor/pull/665")[1], #link("https://github.com/ki-editor/ki-editor/pull/663")[2])],
    [#link("https://github.com/talex5/cuekeeper")[CueKeeper] (#link("https://github.com/talex5/cuekeeper/pull/45")[1])],
    [#link("https://github.com/nixos/nix")[Nix] (#link("https://github.com/nixos/nix/pull/13525")[1])],
    [#link("https://github.com/golang")[Go] (#link("https://github.com/golang/go/issues/62225")[1])],
    [#link("https://github.com/dart-lang")[Dart] (#link("https://github.com/dart-lang/site-www/pull/4618")[1], #link("https://github.com/dart-lang/site-www/pull/5825")[2])],
    [#link("https://github.com/nushell")[Nushell] (#link("https://github.com/nushell/nushell.github.io/pull/835")[1])],
    [#link("https://github.com/pallene-lang/pallene")[Pallene] (#link("https://github.com/pallene-lang/pallene/pull/570")[1])],
    [#link("https://github.com/json-c/json-c")[`json-c`] (#link("https://github.com/json-c/json-c/pull/858")[1])],
    [#link("https://github.com/upspin/upspin")[Upspin] (#link("https://github.com/upspin/upspin/issues/663")[1])],
    [#link("https://github.com/martanne/vis")[`vis`] (#link("https://github.com/martanne/vis/pull/1239")[1])],
  )

  // context {
  //   if target() == "html" {
  //     list(..content)
  //   } else {
      grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 0.8em,
        ..content
      )
  //   }
  // }
}

== Education

// The certificate links to GitHub so the link works in PDF as well as in HTML form, since relative paths are unavailable in PDFs.

=== #link("https://42.fr")[42, the educational institution] (#link("https://raw.githubusercontent.com/alurm/alurm.github.io/refs/heads/main/resume/alan-urmancheev-42-yerevan-completion-certificate.pdf")[completion certificate]): 2021 — 2024

Completed an intensive, project-based curriculum in C, C++, algorithms, and systems programming, equivalent to 2 years of professional coding experience.

== Work experience

=== Software engineer at #link("https://inango.com")[Inango]: January 2023 — April 2023

- Wrote a C memory profiler utilizing Linux's `/proc/$pid/maps`. It has been used to *analyse memory usage patterns* in a service.
- *Integrated TLS* between a company service and a MQTT broker using C, Go, and OpenSSL.
