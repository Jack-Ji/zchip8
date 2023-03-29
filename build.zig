const std = @import("std");
const jok = @import("deps/jok/build.zig");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const exe = jok.createGame(
        b,
        "zchip8",
        "src/main.zig",
        target,
        optimize,
        .{},
    );
    exe.install();

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run game");
    run_step.dependOn(&run_cmd.step);
}
