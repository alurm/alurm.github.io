= Alan Urmancheev

Software Engineer, Systems Programmer

#show link: underline

#{
    let contacts = (
        link("https://github.com/alurm")[GitHub],
        link("https://t.me/alurm")[Telegram],
        link("mailto:alan.urman@gmail.com"),
        link("https://signal.me/#eu/ZH-viwUBe-3OuVix322oldcqy63d1zCk3Alea4RDRTO00KwKthBN25zt88Ut3isI")[Signal],
    )
    grid(columns: contacts.len(), gutter: 5pt, ..contacts)
}

== Skills

Programming languages: C, Go, Bash, C++, Rust.

Technologies: Linux, Git, Docker, Nix, NixOS, computer networking.

Languages: C1 English, fluent Russian.

== Education

In IT since 2019. Studying for a bachelor's degree at the #link("https://42.fr")[programming school 42] for the third year, having #link("https://raw.githubusercontent.com/alurm/alurm.github.io/refs/heads/master/resume/alan-urmancheev-42-common-core.pdf")[completed] the main curriculum.

== Work experience

=== #link("https://inango.com")[Inango], January 2023 -- April 2023

Software Engineer

- Wrote a C memory profiler utilizing Linux's `/proc/$pid/maps`. It has been used to analyse memory patterns in a service.
- Integrated TLS between a company service and a MQTT broker using C, Go, and OpenSSL.

== Personal projects

- A #link("https://github.com/alurm/JSON")[plugin] for the Acme text editor for viewing JSON in Go.
- An #link("https://github.com/alurm/notlang")[interpreter] for a simple shell-like programming language in Go.
- An #link("https://github.com/alurm/42-ping")[implementation] of the ping utility in C.
- An #link("https://github.com/alurm/irc")[IRC server] in C++.
- A #link("https://github.com/alurm/pisciners-faces")[website] to display faces of 42 school students next to their nicknames (Makefile, Bash, Go, Nix).
- A primitive #link("https://github.com/alurm/rustdns")[DNS server] in Rust.
- A #link("https://github.com/alurm/tsoping")[Telegram bot] to post channel updates in Bash, with a NixOS systemd module.

Have a technology focused #link("https://t.me/alurman")[Telegram blog], have given talks at various hackerspaces (#link("https://youtube.com/watch?v=BzqpjE7lgxw")[1], #link("https://youtube.com/watch?v=TJBGWVVmSNE")[2], #link("https://youtube.com/watch?v=noEbul27dHE")[3]).

== Open source

Contributed fixes to
Go (#link("https://github.com/golang/go/issues/62225")[1]),
Dart (#link("https://github.com/dart-lang/site-www/pull/4618")[1], #link("https://github.com/dart-lang/site-www/pull/5825")[2]),
Nushell (#link("https://github.com/nushell/nushell.github.io/pull/835")[1]),
Pallene (#link("https://github.com/pallene-lang/pallene/pull/570")[1]),
`json-c` (#link("https://github.com/json-c/json-c/pull/858")[1]),
Upspin (#link("https://github.com/upspin/upspin/issues/663")[1]).
