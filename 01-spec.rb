#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './01'

describe 'AOC 2024 day 1' do
  SAMPLE_DATA_1 = <<~EOD
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
  EOD

  before(:all) do
  end

  describe 'part 1' do
    it 'should return 11 for the example' do
      @sample = AOC202401.new(SAMPLE_DATA_1)
      expect(@sample.part1).to eq(11)
    end

    it 'should return 2367773 for the input', :api_dependant do
      @day = AOC202401.new(AOCInputFetcher.get_input(2024, 1))
      expect(@day.part1).to eq(2367773)
    end
  end

  describe 'part 2' do
    it 'should return 31 for the example' do
      @sample = AOC202401.new(SAMPLE_DATA_1)
      expect(@sample.part2).to eq(31)
    end

    it 'should return 21271939 for the input', :api_dependant do
      @day = AOC202401.new(AOCInputFetcher.get_input(2024, 1))
      expect(@day.part2).to eq(21271939)
    end
  end
end

