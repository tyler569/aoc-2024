#!/usr/bin/env ruby

require './get_input'

class AOC202403
  def initialize(input)
    @input = input
  end

  def part1
    @input
      .scan(/mul\((\d+),(\d+)\)/)
      .map { |a, b| a.to_i * b.to_i }
      .sum
  end

  def part2
    enabled = true
    @input
      .scan(/(mul|do|don't)\((?:(\d+),(\d+)|)\)/)
      .map do |a, b, c|
        case a
        when 'do'
          enabled = true
          nil
        when "don't"
          enabled = false
          nil
        when 'mul'
          enabled ? b.to_i * c.to_i : 0
        else
          nil
        end
      end
      .compact
      .sum
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 3)
  day = AOC202403.new(input)
  puts "Day 2 Part 1: #{day.part1}"
  puts "Day 2 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
