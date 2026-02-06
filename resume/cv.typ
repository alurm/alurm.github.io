#show title: it => align(center, upper(it))
#show heading.where(level: 1): it => {
  align(center, upper(it))
  // v(-0.8em)
  // line(length: 100%, stroke: (thickness: 0.6pt))
}
#show link: it => underline(text(blue, it))

#title[Alan Urmancheev]

#align(
  center,
  (
    link("mailto:alan.urman@gmail.com"),
    link("https://github.com/alurm")[github.com/alurm],
    link("https://linkedin.com/in/alurm")[linkedin.com/in/alurm],
    link("https://alurm.github.io")[alurm.github.io],
  ).join(" • "),
)

#align(center)[Software engineer, open source maintainer, systems programmer.]

= Technical strengths

*Primary skills*: Rust, C, Go, Git, Linux, Nix/NixOS, Bash, GNU Make.

*Secondary skills*: Docker, SQL, C++, Zig, JavaScript, Python, Haskell, WebAssembly, systemd, networking, system administration.

= Employment history

== Software engineer at #link("https://inango.com")[Inango] #h(1fr) January 2023—April 2023

- Wrote a memory profiler based on `/proc/$pid/maps` in C, which has been used to analyze memory usage patterns for company services.
- Implemented support for transport layer security (TLS) between company services (C, Go, MQTT, OpenSSL).

= Software projects

== #link("https://github.com/alurm/json2dir")[`json2dir`]: a JSON to directory converter in Rust, 100+ stars #h(1fr) 2025

Created an alternative to Nix's `home-manager` used for deploying configuration that doesn't require the Nix builder. Developed a format for representing directories as JSON.

== #link("https://github.com/alurm/alush")[`alush`]: a Unix shell with closures, maps, and a tracing GC in Rust #h(1fr) 2025

Built a shell with native complex data support. Developed a garbage collector in the process and extracted it as a library. #link("https://docs.google.com/presentation/d/1TQ3SVLrquSkBgVF-Ih2LXdOOd4gqzYO1PDxzp0Ltqpg")[Presented] at a Rust meetup at Google Copenhagen.

== #link("https://github.com/alurm/tsoping")[`tsoping`]: a YouTube upload notifier Telegram bot in Bash, 10+ stars #h(1fr) 2024

Developed and deployed a bot that notifies Telegram groups when YouTube channels upload.

== #link("https://github.com/alurm/ping")[`ping`]: ICMP echo networking utility in C #h(1fr) 2024

Implemented checksumming, raw socket manipulation, IPv4 header dumping, packet parsing.

== #link("https://github.com/alurm/JSON")[`JSON`]: a JSON viewer plugin for Acme editor in Go #h(1fr) 2023

Built an extension for Acme editor simplifying navigation of complex JSON structures. #link("https://youtube.com/watch?v=kqXfiNjZgaM")[Video].

== Speaking, writing and teaching

Gave presentations on Git, C (#link("https://youtube.com/watch?v=BzqpjE7lgxw")[1], #link("https://youtube.com/watch?v=TJBGWVVmSNE")[2]), Nix (#link("https://youtube.com/watch?v=noEbul27dHE")[1]), OOP. Maintained a technology focused blog (#link("https://alurm.github.io/blog")[website], #link("https://t.me/alurman")[Telegram]). Mentored a student to develop a side-scroller in C++.

= Open source contributions

#{
  let content = (
    [#link("https://github.com/ki-editor/ki-editor")[Ki Editor] (#link("https://github.com/ki-editor/ki-editor/pull/665")[feat], #link("https://github.com/ki-editor/ki-editor/pull/663")[doc])],
    [#link("https://github.com/talex5/cuekeeper")[CueKeeper] (#link("https://github.com/talex5/cuekeeper/pull/45")[fix])],
    [#link("https://github.com/rust-lang/rust")[Rust] (#link("https://github.com/rust-lang/rust/pull/145476")[doc])],
    [#link("https://github.com/golang")[Go] (#link("https://github.com/golang/go/issues/62225")[doc])],
    [#link("https://github.com/nixos/nix")[Nix, Nixpkgs] (#link("https://github.com/nixos/nix/pull/13525")[doc], #link("https://github.com/NixOS/nixpkgs/pull/427734")[doc])],
    [#link("https://github.com/dart-lang")[Dart] (#link("https://github.com/dart-lang/site-www/pull/4618")[doc], #link("https://github.com/dart-lang/site-www/pull/5825")[doc])],
  )

  grid(
    columns: (1fr, 1fr, 1fr),
    inset: 4pt,
    stroke: (),
    ..content
  )
}

= Education

// The certificate links to GitHub since relative paths don't work in PDFs.

== #link("https://42.fr")[42.fr] programming school (#link("https://alurm.github.io/42-yerevan-certificate.pdf")[certificate]) #h(1fr) July 2021—May 2025

Completed an intensive, project-based curriculum in C, C++, algorithms, and systems programming.
