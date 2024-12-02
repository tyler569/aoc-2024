#!/usr/bin/env ruby

require './get_input'

class AOC202402
  def initialize(input)
    @input = input
    parse!
  end

  def part1
    @reports.count do |report|
      report_is_safe(report)
    end
  end

  def part2
    @reports.count do |report|
      report_can_be_made_safe(report)
    end
  end

  private

  def parse!
    @reports = @input.split("\n").map do |line|
      line.split.map(&:to_i)
    end
  end

  def report_is_safe(report)
    differences = report.each_cons(2).all? do |a, b|
      diff = (a - b).abs
      diff >= 1 && diff <= 3
    end

    increasing = report.each_cons(2).all? do |a, b|
      a < b
    end

    decreasing = report.each_cons(2).all? do |a, b|
      a > b
    end

    differences && (increasing || decreasing)
  end

  def report_can_be_made_safe(report)
    return true if report_is_safe(report)

    report.each_with_index do |_, i|
      new_report = report.dup
      new_report.delete_at(i)
      return true if report_is_safe(new_report)
    end

    false
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 2)
  day = AOC202402.new(input)
  puts "Day 2 Part 1: #{day.part1}"
  puts "Day 2 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
