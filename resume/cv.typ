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

#align(center)[English: C1. Russian: native.]

= Technical strengths

*Primary skills*: Rust, C, Go, Git, Linux, Nix/NixOS, Bash, GNU Make.

*Secondary skills*: Docker, SQL, C++, Zig, JavaScript, Python, Haskell, WebAssembly, systemd, networking, system administration.

= Software projects

== #link("https://github.com/alurm/json2dir")[`json2dir`]: a JSON to directory converter in Rust, 100+ stars #h(1fr) 2025

Created an alternative to Nix's `home-manager` user environment manager that doesn't require the Nix builder. Developed a format for representing directory trees in JSON and an evaluator for it.

== #link("https://github.com/alurm/alush")[`alush`]: a Unix shell with closures, maps, and a tracing GC in Rust #h(1fr) 2025

Built a shell with native complex data support. Developed a garbage collector in the process and extracted it as a #link("https://github.com/alurm/alush/tree/main/gc")[library]. #link("https://docs.google.com/presentation/d/1TQ3SVLrquSkBgVF-Ih2LXdOOd4gqzYO1PDxzp0Ltqpg")[Presented] at a Rust meetup at Google Copenhagen.

== #link("https://github.com/alurm/tsoping")[`tsoping`]: a YouTube upload notifier Telegram bot in Bash, 10+ stars #h(1fr) 2024

Developed and deployed a bot serving 100+ notifications over 1+ year of uptime.

== #link("https://github.com/alurm/ping")[`ping`]: ICMP echo networking utility in C #h(1fr) 2024

Implemented checksumming, raw socket manipulation, IPv4 header dumping, packet parsing, achieving compatibility with standard ping utilities.

== #link("https://github.com/alurm/JSON")[`JSON`]: a JSON viewer plugin for Acme editor in Go #h(1fr) 2023

Built an extension for Acme editor simplifying navigation of complex JSON structures. #link("https://youtube.com/watch?v=kqXfiNjZgaM")[Video].

= Employment history

== SWE at #link("https://inango.com")[Inango] (concurrent with #link("https://42.fr")[42.fr]) #h(1fr) January 2023—April 2023

- Wrote a memory profiler based on `/proc/$pid/maps` in C, which has been used to analyze and optimize memory usage patterns of company's services.
- Secured company's service by implementing Transport Layer Security (TLS) using C, Go, MQTT, and OpenSSL.

= Education

// The certificate links to GitHub since relative paths don't work in PDFs.

== #link("https://42.fr")[42.fr] programming school (#link("https://alurm.github.io/42-yerevan-certificate.pdf")[certificate]) #h(1fr) July 2021—May 2025

Completed an intensive, project-based curriculum in C, C++, algorithms, and systems programming.

= Open source contributions

#{
  let content = (
    [• #link("https://github.com/ki-editor/ki-editor")[Ki Editor] (#link("https://github.com/ki-editor/ki-editor/pull/665")[feature], #link("https://github.com/ki-editor/ki-editor/pull/663")[doc fix])],
    [• #link("https://github.com/talex5/cuekeeper")[CueKeeper] (#link("https://github.com/talex5/cuekeeper/pull/45")[bug fix])],
    [• #link("https://github.com/rust-lang/rust")[Rust] (#link("https://github.com/rust-lang/rust/pull/145476")[doc fix])],
    [• #link("https://github.com/golang")[Go] (#link("https://github.com/golang/go/issues/62225")[doc fix])],
    [• #link("https://github.com/nixos/nix")[Nix, Nixpkgs] (#link("https://github.com/nixos/nix/pull/13525")[doc fix], #link("https://github.com/NixOS/nixpkgs/pull/427734")[doc fix])],
    [• #link("https://github.com/dart-lang")[Dart] (#link("https://github.com/dart-lang/site-www/pull/4618")[doc fix], #link("https://github.com/dart-lang/site-www/pull/5825")[doc fix])],
  )

  grid(
    columns: (1fr, 1fr, 1fr),
    inset: 4pt,
    stroke: (),
    ..content
  )
}
