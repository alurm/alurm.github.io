## What's TacoSprint?

[TacoSprint](https://tacosprint.org) is a week-long sprint dedicated to hacking Nix on the Pacific coast of Mexico. Here I share what happened from my point of view.

This was my first sprint ever, so I wasn't sure what to expect. But it was an amazing experience: lots of Nix hacking, tacos, surfing, learning and meeting cool people. I'm grateful to everyone who participated.

## How did I end up being there?

I knew about this sprint from [Domen Kožar](https://x.com/domenkozar)'s posts on X and wanted to join, but I wasn't expecting to be there, since I currently live in the Caucasus, far away.

But then I saw [this tweet](https://x.com/zimbatm/status/2062495330592022540) by Jonas Chevalier announcing that he is giving away two free tickets.

We talked and he agreed to sponsor me. I am very grateful to him for this opportunity. It has been a blast! I got the ticket, prepared my bags and flew to the location of the sprint.

## What problems to tackle?

This was the first question after arriving. I didn't really know what to be doing at the sprint at first, but [Farid Zakaira](https://fzakaria.com/) had an idea: let's make Nix packages more relocatable. Currently, many packages in Nix rely on absolute paths `/nix/store/...` with no opt-out, which makes it difficult to create self-contained archives or to use a Nix store in a directory different from `/nix/store` without resorting to using something like Linux namespaces. To solve this, relative store paths should be used whenever possible, e.g. `../../<hash>-<name>` instead of `/nix/store/<hash>-<name>`. Farid described potential solutions on his [blog](https://fzakaria.com/2026/06/21/nix-needs-relocatable-binaries).

So we started working on it. He started working on relocatable ELFs, while I started working on shebangs.

## Making Nix more relocatable by supporting relative shebangs in the Linux kernel, `relocatable-shebangs`

One approach to solving this is to make the Linux kernel recognise shebangs of the form `#!${ORIGIN}/<path>`. Then, `${ORIGIN}` refers to the directory where the script being executed can be found, so the interpreter can be located relative to that. This is similar to how `${ORIGIN}` works in RPATH.

I made the patch and the flake that provides the patched kernel.

The patch to the kernel that can be applied is quite small and can be found [here](https://github.com/alurm/relocatable-shebangs/blob/main/relocatable-shebangs.patch).

To support Nix, a modified version of `patch-shebangs.sh` from nixpkgs is provided which rewrites shebangs to the `${ORIGIN}` form.

The repo: <https://github.com/alurm/relocatable-shebangs>.

## Discovering a bug in a kernel comment regarding recursive shebangs

While looking at how shebangs are implemented in Linux and macOS, I discovered a mistake in the comments in the Linux kernel.

In Linux it's possible for the interpreter of a shebanged script to be another shebanged script, up to a certain recursion level.

(Aside: what's interesting is that in macOS it's **not** possible for an interpreter of a script to be a script. [Here are the relevant lines in their kernel](https://github.com/apple/darwin-xnu/blob/2ff845c2e033bd0ff64b5b6aa6063a1f8f65aa32/bsd/kern/kern_exec.c#L559). This means that turning a binary into a shebanged script can be deadly. Perhaps Apple should allow this!)

There's a limit on how much shebang recursion is allowed in Linux, and [this comment](https://github.com/torvalds/linux/blob/f0789fd342e015b20b4d2cb43b473268825ae077/fs/exec.c#L1720) says that the limit is 4. But in the loop following the comment we can see that actually 5 rewrites are allowed.

I fixed this comment and submitted the patch to the Linux mailing lists (via `git-send-email` via Gmail), [here's the thread on lore.kernel.org](https://lore.kernel.org/all/20260623052322.74711-1-alan.urman@gmail.com/T/#u). The patch got applied.

## Making Nix more relocatable without requiring root or a custom kernel by using a custom loader, `relocatable-nix`

The other approach I attempted to make Nix more relocatable is to wrap every binary with a custom loader.

In this approach we wrap every binary or shebanged script in a custom loader which does the following:

- discovers its own location;
- finds the actual program to execute relative to that location;
- for dynamically linked scripts and binaries, uses a special directory with a symlink farm of libraries;
- and calls the executable (via `ld.so` for dynamically linked ones).

So in the end, the call can end up looking like this: `ld.so --library-path <symlink-farm> --argv0 <interpreter> <interpreter> <args...>`, where `<interpreter>` is the relative interpreter. The `ld.so` part is optional.

`relocatableHook` and a function for creating an overlay for nixpkgs which uses this hook are provided for creating relocatable executables.

One particular downside of this approach is that when `ld.so` is used directly, then `/proc/self/exe` points to it instead of pointing to the executable, which can break some programs. Also, each script loaded this way now carries a loader and metadata to support it.

So using kernel `${ORIGIN}` patches is more straightforward and reliable. Farid has made a kernel [patch](https://lore.kernel.org/linux-mm/20260622043934.179879-1-farid.m.zakaria@gmail.com/T/#t) to support origin in interpreter paths of ELF executables to avoid having to call `ld.so` directly.

The repo: <https://github.com/alurm/relocatable-nix>.

## Summary

Overall my experience has been very positive and I would do it again :)

## The paper "Attention, Nix and Tacos is all you need"

Finally, Farid and I worked on this paper to summarize what has been done during the sprint. LLM-assisted coding has been performed during the sprint, hence the name of the paper (a play on "Attention Is All You Need"). It's available below (or via [this link](2026-06-26-attention-nix-and-tacos-is-all-you-need.pdf)):

<embed src="2026-06-26-attention-nix-and-tacos-is-all-you-need.pdf" type="application/pdf" width="100%" height="1000px">
