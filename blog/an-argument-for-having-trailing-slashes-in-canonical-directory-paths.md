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

<title>An argument for having trailing slashes in canonical directory paths</title>

# An argument for having trailing slashes in canonical directory paths

I was writing some GNU make today and remembered an age old question: "Should canonical directory paths contain a trailing slash (as in `dir/`) or not (as in `dir`)?"

I always thought that they shouldn't (so, `dir`).

That makes concatenation easy: always do `$dir/$suffix`. The benefit is that we statically know that `$dir` must be a directory since the path separator is present literally at the concatenation site.

There are no duplicate slashes ever (hint: this is a lie), since `$dir` never contains a trailing slash, so no additional path cleaning (e.g. duplicate slash removal) needs to be done.

But I was wrong. The root directory will always contain a trailing slash, because that's all that is (`/`). There's no way to get rid of it. So the `$dir/$suffix` will always produce `//$suffix` when `$dir` is the root directory.

Repeated slashes are ugly. To fix the ugliness in data, in the code either a special check for `/` should be added or the path must be cleaned.

Well, we replaced the "ugly data" problem with ugly code.

---

So, perhaps canonical directory names should have a trailing slash in them, for simplicity of the general case.

Then concatenation becomes just `$dir$suffix`. There isn't an literal path separator now at the concatenation site now, but an argument can be made that such information is not even that useful. `$dir` can just be a prefix like `not-actually-in-a-new-directory-`, which will be added as a prefix to `$suffix`. I can imagine where this behavior can be useful.

Did I miss anything?
