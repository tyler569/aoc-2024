#!/usr/bin/env ruby

require './get_input'

class AOC202401
  def initialize(input)
    @input = input

    parse!
  end

  def parse!
    @list1 = []
    @list2 = []

    @input.split("\n").each do |line|
      n1, n2 = line.split(" ")
      @list1 << n1.to_i
      @list2 << n2.to_i
    end
  end

  def part1
    @list1.sort!
    @list2.sort!

    total_distance = 0

    @list1.zip(@list2).each do |n1, n2|
      total_distance += (n1 - n2).abs
    end

    total_distance
  end

  def part2
    counts = @list2.tally
    score = 0

    @list1.each do |n1|
      score += n1 * counts.fetch(n1, 0)
    end

    score
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 1)
  day1 = AOC202401.new(input)
  part1 = day1.part1
  puts "Day 1 Part 1: #{part1}"
  part2 = day1.part2
  puts "Day 1 Part 2: #{part2}"
end

main if __FILE__ == $PROGRAM_NAME
