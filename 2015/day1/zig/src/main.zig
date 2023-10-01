const std = @import("std");

const input_path = "../input.txt";

fn part1(instructions: []const u8) i32 {
    // std.debug.print("[{s}]\n", .{instructions});
    var floor: i32 = 0;
    for (instructions) |c| {
        floor += switch (c) {
            '(' => 1,
            ')' => -1,
            else => 0,
        };
    }
    return floor;
}

fn part2(instructions: []const u8) u32 {
    var floor: i32 = 0;
    for (instructions, 0..) |c, i| {
        floor += switch (c) {
            '(' => 1,
            ')' => -1,
            else => 0,
        };
        if (floor == -1) return @as(u32, @intCast(i)) + 1;
    }
    return 0;
}

pub fn main() !void {
    var gpAllocator = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    defer _ = gpAllocator.deinit();
    const allocator = gpAllocator.allocator();

    const file = std.fs.cwd().openFile(input_path, .{}) catch |err| label: {
        std.debug.print("failed to open file: {}\n", .{err});
        const stderr = std.io.getStdErr();
        break :label stderr;
    };
    defer file.close();

    const file_buffer = try file.readToEndAlloc(allocator, 1024 * 10);
    defer allocator.free(file_buffer);

    std.debug.print("Part 1 answer {d} \n", .{part1(file_buffer)});
    std.debug.print("Part 2 answer {d} \n", .{part2(file_buffer)});
}

const expect = std.testing.expect;

test "test part1" {
    try expect(part1("()") == 0);
    try expect(part1(")(") == 0);
    try expect(part1("(())") == 0);
    try expect(part1("()()") == 0);
    try expect(part1("(((") == 3);
    try expect(part1("(()(()(") == 3);
    try expect(part1("))(((((") == 3);
    try expect(part1("())") == -1);
    try expect(part1("))(") == -1);
    try expect(part1(")))") == -3);
    try expect(part1(")())())") == -3);
}

test "test part2" {
    try expect(part2(")") == 1);
    try expect(part2("()())") == 5);
    try expect(part2("()())))") == 5);
}
