const std = @import("std");
const c = @cImport({
    @cInclude("minifb/MiniFB.h");
});

const width = 500;
const height = 500;
const title = "Zig Move Square";
var pixels = [_]u32{0} ** (width * height);
const square_size = 50;
const white = (255 << 16) | (255 << 8) | 255;
var square_x : i32 = 0;
var square_y : i32 = 0;
const speed = 5;
const max_pos = width - square_size;

const left = 0;
const right = 1;
const up = 2;
const down = 3;

var move = [_]i32{0} ** 4;

fn drawSquare(x: i32, y: i32) void  {
    var row = y;
    while (row < y + square_size) : (row += 1) {
        var col = x;
        while (col < x + square_size) : (col += 1) {
            var index = row * width + col;
            pixels[@intCast(usize,index)] = white;
        }
    }
}

fn clearScreen() void {
    std.mem.set(u32,pixels[0..],0);
}

fn keyboard(window: ?*c.mfb_window, key: c.mfb_key, _: c.mfb_key_mod, pressed: bool) callconv(.C) void {
    switch(key) {
        c.KB_KEY_ESCAPE => c.mfb_close(window),
        c.KB_KEY_LEFT   => move[left]  = if (pressed) -1 else 0,
        c.KB_KEY_RIGHT  => move[right] = if (pressed)  1 else 0,
        c.KB_KEY_UP     => move[up]    = if (pressed) -1 else 0,
        c.KB_KEY_DOWN   => move[down]  = if (pressed)  1 else 0,
        else => {},
    }
}

pub fn main() void {
    var window = c.mfb_open_ex(title, width, height, c.WF_RESIZABLE);
    c.mfb_set_keyboard_callback(window, keyboard);

    while (c.mfb_wait_sync(window)) {
        if (c.mfb_update_ex(window, &pixels, width, height) < 0 ) 
            break;

        // update
        square_x += (move[left] + move[right]) * speed;
        square_y += (move[up] + move[down]) * speed;
        square_x = std.math.clamp(square_x, 0, max_pos);
        square_y = std.math.clamp(square_y, 0, max_pos);
        // render
        clearScreen();
        drawSquare(square_x,square_y);
    }
}