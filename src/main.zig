const std = @import("std");
const jok = @import("jok");
const sdl = jok.sdl;
const j2d = jok.j2d;
const j3d = jok.j3d;

const display_width = 64;
const display_height = 32;

/// CHIP-8 instance
const Chip8 = struct {
    /// CHIP-8 has direct access to up to 4 kilobytes of RAM
    mem: []u8,

    /// A program counter, often called just “PC”, which points at the current
    /// instruction in memory The first CHIP-8 interpreter (on the COSMAC VIP
    /// computer) was also located in RAM, from address 000 to 1FF. It would
    /// expect a CHIP-8 program to be loaded into memory after it, starting at
    /// address 200 (512 in decimal).
    pc: usize = 0x200,

    fn init(allocator: std.mem.Allocator) !Chip8 {
        return .{
            .mem = try allocator.alloc(u8, 4096),
        };
    }

    fn deinit(self: *Chip8, allocator: std.mem.Allocator) void {
        allocator.free(self.mem);
        self.* = undefined;
    }
};

var chip8: Chip8 = undefined;

pub fn init(ctx: jok.Context) !void {
    chip8 = try Chip8.init(ctx.allocator());
}

pub fn event(ctx: jok.Context, e: sdl.Event) !void {
    _ = ctx;
    _ = e;
}

pub fn update(ctx: jok.Context) !void {
    _ = ctx;
}

pub fn draw(ctx: jok.Context) !void {
    _ = ctx;

    {
        try j2d.begin(.{});
        // ......
        try j2d.end();
    }

    {
        try j3d.begin(.{});
        // ......
        try j3d.end();
    }
}

pub fn quit(ctx: jok.Context) void {
    chip8.deinit(ctx.allocator());
}
