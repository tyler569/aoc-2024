#!/usr/bin/env ruby

require './get_input'
require './grid'

class AOC202408
  def initialize(input)
    @input = input
    parse!
  end

  def part1
    working_grid = @grid.clone
    @antennae.each do |char, coords|
      coords.permutation(2).each do |(x1, y1), (x2, y2)|
        diff = [x2 - x1, y2 - y1]
        p1 = [x1 - diff[0], y1 - diff[1]]
        next unless working_grid.in_bounds?(*p1)
        working_grid[*p1] = '#'
      end
    end
    working_grid.count('#')
  end

  def part2
    working_grid = @grid.clone
    @antennae.each do |char, coords|
      coords.permutation(2).each do |(x1, y1), (x2, y2)|
        diff = [x2 - x1, y2 - y1]
        for i in 0..1000
          p1 = [x1 - diff[0] * i, y1 - diff[1] * i]
          break unless working_grid.in_bounds?(*p1)
          working_grid[*p1] = '#'
        end
      end
    end
    working_grid.count('#')
  end

  def parse!
    @grid = Grid.from_string(@input)
    @antennae = Hash.new { |h, k| h[k] = [] }
    @grid.each_with_index do |char, x, y|
      next if char == '.'
      @antennae[char] << [x, y]
    end
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 8)
  day = AOC202408.new(input)
  puts "Day 8 Part 1: #{day.part1}"
  puts "Day 8 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
