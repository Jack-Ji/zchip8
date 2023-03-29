const std = @import("std");
const jok = @import("jok");
const sdl = jok.sdl;
const j2d = jok.j2d;
const j3d = jok.j3d;

pub fn init(ctx: jok.Context) !void {
    _ = ctx;
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
    _ = ctx;
}
