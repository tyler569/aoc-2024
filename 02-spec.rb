#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './02'

describe 'AOC 2024 day 2' do
  SAMPLE_DATA_2 = <<~EOD
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
  EOD

  describe 'part 1' do
    it 'should return 2 for the example' do
      @sample = AOC202402.new(SAMPLE_DATA_2)
      expect(@sample.part1).to eq(2)
    end

    it 'should return 279 for the input', :api_dependant do
      @day = AOC202402.new(AOCInputFetcher.get_input(2024, 2))
      expect(@day.part1).to eq(279)
    end
  end

  describe 'part 2' do
    it 'should return 4 for the example' do
      @sample = AOC202402.new(SAMPLE_DATA_2)
      expect(@sample.part2).to eq(4)
    end

    it 'should return 343 for the input', :api_dependant do
      @day = AOC202402.new(AOCInputFetcher.get_input(2024, 2))
      expect(@day.part2).to eq(343)
    end
  end
end

