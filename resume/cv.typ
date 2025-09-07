#show link: it => underline(text(blue, it))
#show heading.where(level: 1): it => align(center, it)
#show heading.where(level: 2): it => align(center, it)

= Alan Urmancheev

#(
  link("mailto:alan.urman@gmail.com"),
  link("https://github.com/alurm")[github.com/alurm],
  link("https://linkedin.com/in/alurm")[linkedin.com/in/alurm],
  link("https://alurm.github.io")[alurm.github.io],
).join(" • ")

Software engineer. Open source contributor. Graduate of the world-class 42.fr coding school.

== Technical skills

*Primary programming languages*: Rust, Nix, C, Go.

*Primary technologies*: Linux, Docker, GNU Make, Bash, Git.

*Secondary skills*: SQL, C++, JavaScript, Python, Haskell, NixOS, computer networking.

== Personal projects

=== #link("https://github.com/alurm/json2dir")[`json2dir`]: JSON-to-directory converter, 100+ stars on GitHub (Rust, Nix) #h(1fr) 2025

`json2dir` is used as a fast alternative to `home-manager` for managing dotfiles.

=== #link("https://github.com/alurm/alush")[`alush`]: Unix shell with closures, hashmaps, and tracing GC (Rust) #h(1fr) 2025

`alush` is a shell that supports structured data natively, which is lacking is shells like Bash.

=== #link("https://github.com/alurm/ping")[`ping`]: implementation of ping networking utility (C, Nix) #h(1fr) 2024

`ping` allows sending ICMP packets to internet hosts to discover their availability.

=== #link("https://github.com/alurm/tsoping")[`tsoping`]: YouTube channel update Telegram notifier, 10+ stars on GitHub (Bash, Nix) #h(1fr) 2024

`tsoping` is a Telegram bot that posts a message to a group every time a channel posts on YouTube.

=== #link("https://github.com/alurm/JSON")[`JSON`]: plugin for Acme text editor for viewing JSON (Go) #h(1fr) 2023

`JSON` represents JSON structures as interactive buffers, making in easy to explore JSON (#link("https://youtube.com/shorts/kqXfiNjZgaM")[video]).

=== #link("https://github.com/alurm/irc")[`irc`]: IRC server (C++) #h(1fr) 2023

`irc` implements the client-server part of the IRC specification, making it useful as an IRC server.

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
    [#link("https://github.com/nixos/nixpkgs")[`nixpkgs`] (#link("https://github.com/NixOS/nixpkgs/pull/427734")[1])],
    [#link("https://github.com/rust-lang/rust")[`rust`] (#link("https://github.com/rust-lang/rust/pull/145476")[1])],
  )

  grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 5pt,
    stroke: black,
    ..content
  )
}

== Work experience

=== Software engineer at #link("https://inango.com")[Inango] #h(1fr) January 2023 — April 2023

- Wrote a C memory profiler utilizing Linux's `/proc/$pid/maps`. It has been used to *analyse memory usage patterns* in a service.
- *Integrated TLS* between a company service and a MQTT broker using C, Go, and OpenSSL.

== Education

// The certificate links to the absolute path on the website so the link works in PDF as well as in HTML form, since relative paths are unavailable in PDFs.

=== #link("https://42.fr")[42] programming school (#link("https://alurm.github.io/42-yerevan-certificate.pdf")[certificate]) #h(1fr) July 2021 — May 2025

Completed an intensive, project-based curriculum in C, C++, algorithms, and systems programming, equivalent to 2 years of professional coding experience.

== Public speaking

Have a *technology focused blog* (#link("https://alurm.github.io/blog")[web], #link("https://t.me/alurman")[Telegram]). Have given talks about *Git, C (#link("https://youtube.com/watch?v=BzqpjE7lgxw")[1], #link("https://youtube.com/watch?v=TJBGWVVmSNE")[2]), Nix (#link("https://youtube.com/watch?v=noEbul27dHE")[1]), OOP*, and other topics.
