// Copyright (c) 2022 XXIV
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
extern "C" fn open_that(path: [*c]const u8) c_int;

extern "C" fn open_with(path: [*c]const u8, app: [*c]const u8) c_int;

pub const Error = error{
    Failure
};

/// Open path with the default application without blocking.
/// 
/// Example:
/// * *
/// const lib = @import("open");
/// 
/// pub fn main() !void {
///     try lib.openThat("https://ziglang.org/");
/// }
/// * *
/// 
/// @param path
/// @return Error
pub fn openThat(path: []const u8) Error!void {
    const is_err = open_that(path.ptr);
    if (is_err != 0) {
        return Error.Failure;
    }
}

/// Open path with the given application.
/// 
/// Example:
/// * *
/// const lib = @import("open");
/// 
/// pub fn main() !void {
///     try lib.openWith("https://ziglang.org/", "firefox");
/// }
/// * *
/// 
/// @param path
/// @return Error
pub fn openWith(path: []const u8, app: []const u8) Error!void {
    const is_err = open_with(path.ptr, app.ptr);
    if (is_err != 0) {
        return Error.Failure;
    }
}

test "openThat" {
    try openThat("https://ziglang.org/");
}

test "openWith" {
    try openWith("https://ziglang.org/", "firefox");
}