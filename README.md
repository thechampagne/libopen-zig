# libopen-zig

[![](https://img.shields.io/github/v/tag/thechampagne/libopen-zig?label=version)](https://github.com/thechampagne/libopen-zig/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libopen-zig)](https://github.com/thechampagne/libopen-zig/blob/main/LICENSE)

Zig binding for **libopen**.

### API

```zig
fn openThat(path: []const u8) Error!void;

fn openWith(path: []const u8, app: []const u8) Error!void;
```

### References
 - [libopen](https://github.com/thechampagne/libopen)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libopen-zig/blob/main/LICENSE).