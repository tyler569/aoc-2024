#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './07'

describe 'AOC 2024 day 7' do
  SAMPLE_DATA_7 = <<~EOD
    190: 10 19
    3267: 81 40 27
    83: 17 5
    156: 15 6
    7290: 6 8 6 15
    161011: 16 10 13
    192: 17 8 14
    21037: 9 7 18 13
    292: 11 6 16 20
  EOD

  describe 'part 1' do
    it 'should return 3749 for the example' do
      @sample = AOC202407.new(SAMPLE_DATA_7)
      expect(@sample.part1).to eq(3749)
    end

    it 'should return 5512534574980 for the input', :api_dependant do
      @day = AOC202407.new(AOCInputFetcher.get_input(2024, 7))
      expect(@day.part1).to eq(5512534574980)
    end
  end

  describe 'part 2' do
    it 'should return 11387 for the example' do
      @sample = AOC202407.new(SAMPLE_DATA_7)
      expect(@sample.part2).to eq(11387)
    end

    xit 'should return 328790210468594 for the input', :api_dependant do
      @day = AOC202407.new(AOCInputFetcher.get_input(2024, 7))
      expect(@day.part2).to eq(328790210468594)
    end
  end
end
