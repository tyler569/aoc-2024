#!/usr/bin/env ruby

require './get_input'

class AOC202409
  def initialize(input)
    @input = input
  end

  def part1
    disk = expand_input
    packed_disk = pack_disk(disk)
    checksum(packed_disk)
  end

  def part2
  end

  def expand_input
    empty = false
    num = 0
    result = []
    @input.chars.each do |c|
      i = c.to_i
      if empty
        result += [nil] * i
        empty = false
      else
        result += [num] * i
        empty = true
        num += 1
      end
    end
    result
  end

  def is_packed?(disk)
    first_empty = disk.index(nil)
    last_filled = disk.rindex { |x| x != nil }
    first_empty > last_filled
  end

  def pack_disk(disk)
    loop do
      first_empty = disk.index(nil)
      last_filled = disk.rindex { |x| x != nil }
      break if first_empty > last_filled
      disk[first_empty], disk[last_filled] = disk[last_filled], disk[first_empty]
    end
    disk
  end

  def checksum(disk)
    disk.compact.each_with_index.reduce(0) do |sum, (x, i)|
      sum + x * i
    end
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 9)
  day = AOC202409.new(input)
  puts "Day 9 Part 1: #{day.part1}"
  puts "Day 9 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
