#!/usr/bin/env ruby

require './get_input'

class AOC202405
  def initialize(input)
    @input = input
    parse!
  end

  def part1
    total = 0

    @updates.each do |update|
      next if update != update.sort
      total += middle_item(update).to_i
    end

    total
  end

  def part2
    total = 0

    @updates.each do |update|
      next if update == update.sort
      total += middle_item(update.sort).to_i
    end

    total
  end

  class AOCSortable
    include Comparable

    def initialize(value, ordering)
      @value = value
      @ordering = ordering
    end

    def <=>(other)
      @ordering.include?("#{@value}|#{other.value}") ? -1 : 1
    end

    def value
      @value
    end

    def to_i
      @value.to_i
    end

    def to_s
      @value
    end
  end

  def parse!
    rules, updates = @input.split("\n\n")
    rules = rules.split("\n")

    @updates = updates.split("\n").map do |update|
      update.split(",").map { |i| AOCSortable.new(i, rules) }
    end
  end

  def middle_item(update)
    update[update.length / 2]
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 5)
  day = AOC202405.new(input)
  puts "Day 5 Part 1: #{day.part1}"
  puts "Day 5 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
