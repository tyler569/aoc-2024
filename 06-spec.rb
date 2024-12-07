#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './06'

describe 'AOC 2024 day 6' do
  SAMPLE_DATA_6 = <<~EOD
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
  EOD

  describe 'part 1' do
    it 'should return 41 for the example' do
      @sample = AOC202406.new(SAMPLE_DATA_6)
      expect(@sample.part1).to eq(41)
    end

    it 'should return 5305 for the input', :api_dependant do
      @day = AOC202406.new(AOCInputFetcher.get_input(2024, 6))
      expect(@day.part1).to eq(5305)
    end
  end

  describe 'part 2' do
    it 'should return 6 for the example' do
      @sample = AOC202406.new(SAMPLE_DATA_6)
      expect(@sample.part2).to eq(6)
    end

    # skipped because it takes too long
    xit 'should return 2143 for the input', :api_dependant do
      @day = AOC202406.new(AOCInputFetcher.get_input(2024, 6))
      expect(@day.part2).to eq(2143)
    end
  end
end
