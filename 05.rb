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
      catch :nope do
        combs = update.combination(2)
        combs.each do |comb|
          throw :nope if @rules.include?(comb.reverse)
        end
        total += middle_item(update).to_i
      end
    end

    total
  end

  def part2
  end

  def parse!
    rules, updates = @input.split("\n\n")

    @rules = rules.split("\n").map do |rule|
      rule.split("|")
    end

    @updates = updates.split("\n").map do |update|
      update.split(",")
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
