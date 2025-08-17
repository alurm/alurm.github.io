#show link: it => underline(text(blue, it))
#show heading.where(level: 1): it => align(center, it)
#show heading.where(level: 2): it => align(center, it)

= Alan Urmancheev: software engineer, systems programmer, open source contributor, public speaker

#link("mailto:alan.urman@gmail.com")
#link("https://github.com/alurm")[GitHub]
#link("https://t.me/alurm")[Telegram]

== Technical skills

*Programming languages*: Rust, C, Go.

*Technologies*: Linux, Git, Docker, Nix, GNU Make, Bash, jq.

*Languages*: advanced English, native Russian.

*Secondary skills*: C++, Haskell, SQL, computer networking, systems administration.

== Projects

- #link("https://github.com/alurm/json2dir")[`json2dir`]: a JSON-to-directory converter, *which is used as a fast alternative to home-manager* for managing dotfiles (Rust, Nix, *100+ stars on GitHub*).
- A cycle collecting *#link("https://github.com/alurm/alush/blob/main/gc/README.md")[garbage collector]* and #link("https://github.com/alurm/alush")[shell] with closures and maps (Rust, Nix).
- An #link("https://github.com/alurm/42-ping")[implementation] of the ping *networking utility* (C23).
- A *#link("https://github.com/alurm/JSON")[plugin] for the Acme text editor* for viewing JSON (Go).
- A #link("https://github.com/alurm/tsoping")[Telegram bot] that *has been used* to post YouTube channel updates to a group (Bash, NixOS, systemd).
- An #link("https://github.com/alurm/irc")[IRC server] in (C++). This was a group project *I have lead*.

Have a *technology focused blog* (#link("https://alurm.github.io/#blog")[on the web], #link("https://t.me/alurman")[on Telegram]). *Have given public talks* (on Git, C (#link("https://youtube.com/watch?v=BzqpjE7lgxw")[1], #link("https://youtube.com/watch?v=TJBGWVVmSNE")[2]), Nix (#link("https://youtube.com/watch?v=noEbul27dHE")[1]) and other topics).

== Open source contributions

- #link("https://github.com/ki-editor/ki-editor")[`ki-editor`] (text editor): #link("https://github.com/ki-editor/ki-editor/pull/665")[1], #link("https://github.com/ki-editor/ki-editor/pull/663")[2]
- The #link("https://github.com/talex5/cuekeeper")[CueKeeper] (Get Things Done system): #link("https://github.com/talex5/cuekeeper/pull/45")[1]
- #link("https://github.com/nixos/nix")[Nix] (package manager): #link("https://github.com/nixos/nix/pull/13525")[1]
- #link("https://github.com/golang")[Go] (programming language): #link("https://github.com/golang/go/issues/62225")[1]
- #link("https://github.com/dart-lang")[Dart] (programming language): #link("https://github.com/dart-lang/site-www/pull/4618")[1], #link("https://github.com/dart-lang/site-www/pull/5825")[2]
- #link("https://github.com/nushell")[Nushell] (shell) #link("https://github.com/nushell/nushell.github.io/pull/835")[1]
- #link("https://github.com/pallene-lang/pallene")[Pallene] (programming language): #link("https://github.com/pallene-lang/pallene/pull/570")[1]
- #link("https://github.com/json-c/json-c")[`json-c`] (JSON library) #link("https://github.com/json-c/json-c/pull/858")[1]
- #link("https://github.com/upspin/upspin")[Upspin] (naming system): #link("https://github.com/upspin/upspin/issues/663")[1]
- #link("https://github.com/martanne/vis")[`vis`] (text editor): #link("https://github.com/martanne/vis/pull/1239")[1]

== Education

// The certificate links to GitHub so the link works in PDF as well as in HTML form, since relative paths are unavailable in PDFs.

=== #link("https://42.fr")[42, the education institution] (#link("https://raw.githubusercontent.com/alurm/alurm.github.io/refs/heads/main/resume/alan-urmancheev-42-yerevan-completion-certificate.pdf")[completion certificate]) #h(1fr) 2021 — 2024

Completed an intensive, project-based curriculum in C, C++, algorithms, and systems programming, equivalent to 2 years of professional coding experience.

== Work experience

=== Software engineer at #link("https://inango.com")[Inango] #h(1fr) January 2023 — April 2023

- Wrote a C memory profiler utilizing Linux's `/proc/$pid/maps`. It has been used to *analyse memory usage patterns* in a service.
- *Integrated TLS* between a company service and a MQTT broker using C, Go, and OpenSSL.
