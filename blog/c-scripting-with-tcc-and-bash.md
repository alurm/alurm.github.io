<style>
	* { font-size: calc(1rem + 0.10vw); }
	h3 { font-size: calc(1.2rem + 0.15vw); }
	h2 { font-size: calc(1.4rem + 0.20vw); }
	h1 { font-size: calc(1.6rem + 0.25vw); }
	body { margin: 0 auto; max-width: 50em; }
	pre { overflow: scroll; border: 1px solid black; }
	@media(prefers-color-scheme: dark) {
		body {
			/* https://m3.material.io/blog/android-dark-theme-tutorial. */
			background-color: #121212;
			color: white;
		}
		a {
			color: #00ff00;
		}
	}
</style>

<title>C scripting with TCC and Bash</title>

# C scripting with TCC and Bash

How to know what's the value of the constant `INT_MAX` in the C header `<limits.h>`? There are many ways. However, here's how I like to do it: by running a script in C. Here it is:

	$ tcc -run <(printf '%s\n' '#include <'{stdio,limits}'.h>' 'int main() { printf("%u\n", INT_MAX); }')
	2147483647

Now that you've seen this, let's take this command line apart, going from the left to the right.

## `tcc`

This part is easy, [TCC](https://bellard.org/tcc/) (the "Tiny C Compiler") is a C compiler.

## `-run`

This flag allows TCC to run C programs without creating intermediate files, which is useful for a throwaway script like ours.

The script can accept other arguments as well. Here's an example where arguments `23` and `34` are passed to the C program. with the output being the string `57`:

	$ tcc -run <(printf '%s\n' '#include <'{stdio,stdlib}'.h>' 'int main(int argc, char **argv) { printf("%d\n", atoi(argv[1]) + atoi(argv[2])); }') 23 34
	57

## `<(...)`

This feature of Bash is called [_process substitution_](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html). In this case, it allows output of the command inside the parenthesis to be available using a filename.

Here's an example:

	$ echo <(echo hello)
	/dev/fd/63

	$ cat <(echo hello)
	hello

As we can see from `echo <(echo hello)`, from the perspective of the receiving command process substitution expression gets replaced by the string `/dev/fd/N` where `N` is the number of the descriptor Bash opened to capture the output of `echo hello`.

What's special about `/dev/fd/N`? This path provides us access to the file descriptor `N`. In the second example we can see that the file `/dev/fd/N` can be read by the receiving process to get the standard output of `echo hello`. `cat <(echo hello)` prints `hello`.

## `printf '%s\n'`

What's [`printf`](http://man.openbsd.org/printf) here? Turns out that `printf` is not only a name of a function in C, but also of a utility. It allows us to do formatted output (`printf` allows to _print formatted_). The first argument is the format string (`%s\n` instructs to print each argument on a single line), the rest are the arguments to be formatted. Here's an example:

	$ printf 'the argument: %s\n' hello '' world
	the argument: hello
	the argument:
	the argument: world

Each of the three arguments (`"hello"`, `""`, and `"world"`) is printed on a separate line and prefixed by the string `"the argument"`. Even the empty string.

Why do we need this here? The answer is [the C preprocessor](https://en.cppreference.com/w/c/preprocessor).

As we'll see later, in our C code there are two different C headers which we need: `stdio.h` for the `printf` C function and `limits.h` for the definition of the macro `INT_MAX`. This requires two include directives, and there can't be multiple directives on one line. Which is why we use `printf` here to specify multiple lines in a single command line, one per argument.

## `'#include <'{stdio,limits}'.h>'`

What's interesting here is the `{stdio,limits}` part. What is it? A yet another feature of Bash called [_brace expansion_](https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html). It allows us to add prefixes and suffixes to multiple strings at once. Here's an example:

	$ printf '%s\n' dir/{a,b,c}.c
	dir/a.c
	dir/b.c
	dir/c.c

As we can see, strings `a,` `b,` and `c` are prefixed by `dir/` and suffixed by `.c`.

What does `'#include <'{stdio,limits}'.h>'` do then? That's right, it prefixes strings `stdio` and `limits` with the string `#include <` and suffixes them with the string `.h>`. To verify this, let's the results of brace expansion on a separate line with `printf`: 

	$ printf '%s\n' '#include <'{stdio,limits.}'.h>'
	#include <stdio.h>
	#include <limits.h>

## `'int main() { printf("%u\n", INT_MAX); }'`

This is the meat of the program we want to run, put into single quotes to be presented as a single string to `printf`.

Together with the two include directives this forms a complete C program.

**This is it.**

To summarize, let's see the final program by replacing `tcc -run` with `cat`:

	$ cat <(printf '%s\n' '#include <'{stdio,limits}'.h>' 'int main(void) { printf("%d\n", INT_MAX); }')
	#include <stdio.h>
	#include <limits.h>
	int main(void) { printf("%d\n", INT_MAX); }

This will print the value `INT_MAX`. This is exactly what we wanted.

## Postscriptum about Plan 9's rc

For [Plan 9](https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs) fans out there, here's a way to do the same in the `rc` shell.

`rc` has analogues for process substitution and brace expansion, so the command line will be quite similar:

	; tcc -run <{printf '%s\n' '#include <'^(stdio limits)^'.h>' 'int main(void) { printf("%d\n", INT_MAX); }'}
	2147483647

## Postscriptum about stdin

For programs that don't require reading from the standard input (like the one we have), the command line can be simpler, requiring no process substitution:

	$ printf '%s\n' '#include <'{stdio,limits}'.h>' 'int main() { printf("%u\n", INT_MAX); }' | tcc -run -
	2147483647

This makes `tcc` read the program from the standard input. `tcc -run /dev/stdin` would also work.
