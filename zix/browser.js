const wasmModule = await WebAssembly.instantiateStreaming(
  fetch("zig-out/bin/browser.wasm"),
);

const zig = wasmModule.instance.exports;

const toZig = (input) => {
  const utf8 = new TextEncoder().encode(input);
  const result = zig.allocate(utf8.length);
  const ptr = zig.ptr(result);
  const bytes = new Uint8Array(zig.memory.buffer);
  for (let i = 0; i < utf8.length; i++) bytes[ptr + i] = utf8[i];
  return result;
};

const toJs = (input) => {
  try {
    const len = zig.len(input);
    if (len === 0) return "";
    const ptr = zig.ptr(input);
    const decoder = new TextDecoder("utf8", { fatal: true });
    const bytes = new DataView(zig.memory.buffer, ptr, len);
    return decoder.decode(bytes);
  } finally {
    zig.free(input);
  }
};

window.zix = {
  wasmModule,
  toJs,
  toZig,
  zig,
};

window.zix.interpret = () => {
  outputTextArea.value = toJs(zig.interpret(toZig(inputTextArea.value)));
};

window.zix.reset = () => {
  zig.reset();
};
