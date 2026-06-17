## TL;DR

```c
#include <stdio.h>
#include "vec.h"
int main() {
    int *vec[2] = { 0 };
    vec_push(vec, 42);
    vec_push(vec, 43);
    for (size_t i = 0; i < (size_t)vec_len[vec]; i++) printf("%d\n", vec_ptr[vec][i]);
    free(vec_ptr[vec]);
}
```

[Source code and more examples](https://gist.github.com/alurm/2ca14be134d719fe7431217a6b18d91e).

## Explanation

This header shows a way to make a generic dynamic array in C with an array of two pointers:

- one pointer (accessible as `vec_ptr[vec]`) points to the data;
- the other pointer (accessible as `vec_len[vec]`) encodes the length of the array in the pointer. Thus, `(size_t)vec_len[vec]` returns the len as `size_t`.

So, `int *vec[2] = { 0 };` is an empty dynamic array of ints. `struct person *people[2] = { 0 };` is an empty dynamic array of people.

The `vec_push(vec, value)` macro pushes a value at the end of a dynamic array. It returns true if pushing succeeded, and false otherwise. Note that the dynamic array is not automatically freed on failure.

This code is C23 with statement expressions (a GNU C feature).

(If you're wondering why `vec_ptr[vec]` works, it's because `a[b]` and `b[a]` both evaluate to `*(a + b)` in C.)

## Why is this interesting

First of all, structs aren't used so you don't have to invent names for them (e.g. there is no `IntVec`), because a pointer is used to encode the length of a dynamic array. **Caveat**: this design assumes pointers have no trap representations and round-trip integer values, so it may fail on architectures where this assumption doesn't hold.

Second of all, capacity isn't stored at all by default. Instead, it's computed on demand when the length of a vec is either zero or a power of two at the time `vec_push` is called. In this case `realloc` is called with capacity equal to the next power of two greater than the length. The drawback is that it's more difficult to "reserve" elements: during pushing, when the length reaches a power of two, `realloc` is called for the next power of two no matter what, so a larger manual reservation is effectively discarded.

## Support for optional capacity

Plot twist! It's possible to store capacity if the declared array contains three elements, e.g. `int *vec[3] = { 0 };`. `vec_push` is generic (in the `_Generic` sense) and handles such arrays automatically. If the given array has a capacity, `realloc` will be called only if the length becomes equal to the capacity, as opposed to calling it every time the length of a vec is either zero or a power of two at the time `vec_push` is called. This may be desired in some use cases. `vec_cap[vec]` can be used to access the capacity of such dynamic arrays.

---

Comments on [Lobsters](https://lobste.rs/s/n3c04h/generic_dynamic_array_c_stores_no), [Hackernews](https://news.ycombinator.com/item?id=48512286).
