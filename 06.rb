#!/usr/bin/env ruby

require './get_input'

class AOC202406
  def initialize(input)
    @input = input
    parse!
  end

  def part1
    trace_path[0].size
  end

  def part2
    seen = trace_path[0]

    seen.count do |pos, _|
      next if pos == @guard_pos
      _, seen_loop = trace_path(extra_obstacle: pos)
      seen_loop
    end
  end

  def parse!
    @board = {}
    @guard = nil
    @input.lines.each_with_index do |line, y|
      line.chomp.chars.each_with_index do |char, x|
        loc = Pair.new(x, y)
        @board[loc] = char
        if char == '^'
          @guard_pos = loc
          @board[loc] = '.'
        end
      end
    end
  end

  def trace_path(extra_obstacle: nil)
    guard = Guard.new(@guard_pos.x, @guard_pos.y, :up)
    seen = {@guard_pos => {:up => true}}
    seen_loop = false

    if extra_obstacle
      board = @board.dup
      board[extra_obstacle] = '#'
    else
      board = @board
    end

    catch :leaving_board do
      loop do
        guard.move(board)
        seen[guard.pos] ||= {}
        if seen[guard.pos][guard.facing]
          seen_loop = true
          break
        end
        seen[guard.pos][guard.facing] = true
      end
    end

    [seen, seen_loop]
  end
end

Pair = Struct.new(:x, :y)

class Guard
  attr_reader :x, :y, :facing

  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end

  def move(board)
    x, y = @x, @y
    case @facing
    when :up
      y -= 1
    when :down
      y += 1
    when :left
      x -= 1
    when :right
      x += 1
    end
    if board[Pair.new(x, y)] == '.'
      @x = x
      @y = y
    elsif board[Pair.new(x, y)] == '#'
      turn
      move(board)
    else
      throw :leaving_board
    end
  end

  def turn
    case @facing
    when :up
      @facing = :right
    when :right
      @facing = :down
    when :down
      @facing = :left
    when :left
      @facing = :up
    end
  end

  def pos
    Pair.new(@x, @y)
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 6)
  day = AOC202406.new(input)
  puts "Day 6 Part 1: #{day.part1}"
  puts "Day 6 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
