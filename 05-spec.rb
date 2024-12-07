#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './05'

describe 'AOC 2024 day 5' do
  SAMPLE_DATA_5 = <<~EOD
    47|53
    97|13
    97|61
    97|47
    75|29
    61|13
    75|53
    29|13
    97|29
    53|29
    61|53
    97|53
    61|29
    47|13
    75|47
    97|75
    47|61
    75|61
    47|29
    75|13
    53|13

    75,47,61,53,29
    97,61,53,29,13
    75,29,13
    75,97,47,61,53
    61,13,29
    97,13,75,29,47
  EOD

  describe 'part 1' do
    it 'should return 143 for the example' do
      @sample = AOC202405.new(SAMPLE_DATA_5)
      expect(@sample.part1).to eq(143)
    end

    it 'should return 6034 for the input', :api_dependant do
      @day = AOC202405.new(AOCInputFetcher.get_input(2024, 5))
      expect(@day.part1).to eq(6034)
    end
  end

  describe 'part 2' do
    it 'should return 123 for the example' do
      @sample = AOC202405.new(SAMPLE_DATA_5)
      expect(@sample.part2).to eq(123)
    end

    it 'should return 6305 for the input', :api_dependant do
      @day = AOC202405.new(AOCInputFetcher.get_input(2024, 5))
      expect(@day.part2).to eq(6305)
    end
  end
end
