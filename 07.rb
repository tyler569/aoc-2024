#!/usr/bin/env ruby

require './get_input'

class AOC202407
  def initialize(input)
    @input = input
    parse!
  end

  def part1
    test_rules_for_total([:+, :*])
  end

  def part2
    test_rules_for_total([:+, :*, :concat])
  end

  def parse!
    @rules = []
    @input.chomp.split("\n").each do |line|
      total, nums = line.split(": ")
      total = total.to_i
      nums = nums.split(" ").map(&:to_i)
      @rules << [total, nums]
    end
  end

  def apply_ops(nums, ops)
    acc = nums[0]
    nums[1..].each_with_index do |num, i|
      if ops[i] == :concat
        acc = (acc.to_s + num.to_s).to_i
      else
        acc = acc.send(ops[i], num)
      end
    end
    acc
  end

  def test_rules_for_total(ops)
    whole = 0

    @rules.each do |total, nums|
      perms = ops.repeated_permutation(nums.length - 1)
      perms.each do |ops|
        if apply_ops(nums, ops) == total
          whole += total
          break
        end
      end
    end

    whole
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 7)
  day = AOC202407.new(input)
  puts "Day 7 Part 1: #{day.part1}"
  puts "Day 7 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
