#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './04'

describe 'AOC 2024 day 4' do
  SAMPLE_DATA_4 = <<~EOD
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
  EOD

  before(:all) do
  end

  describe 'part 1' do
    it 'should return 18 for the example' do
      @sample = AOC202404.new(SAMPLE_DATA_4)
      expect(@sample.part1).to eq(18)
    end

    it 'should return 279 for the input', :api_dependant do
      @day = AOC202404.new(AOCInputFetcher.get_input(2024, 4))
      expect(@day.part1).to eq(2654)
    end
  end

  describe 'part 2' do
    it 'should return 9 for the example' do
      @sample = AOC202404.new(SAMPLE_DATA_4)
      expect(@sample.part2).to eq(9)
    end

    it 'should return 1990 for the input', :api_dependant do
      @day = AOC202404.new(AOCInputFetcher.get_input(2024, 4))
      expect(@day.part2).to eq(1990)
    end
  end
end

