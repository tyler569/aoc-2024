#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './08'

describe 'AOC 2024 day 8' do
  SAMPLE_DATA_8 = <<~EOD
    ............
    ........0...
    .....0......
    .......0....
    ....0.......
    ......A.....
    ............
    ............
    ........A...
    .........A..
    ............
    ............
  EOD

  describe 'part 1' do
    it 'should return 0 for the example' do
      @sample = AOC202408.new(SAMPLE_DATA_8)
      expect(@sample.part1).to eq(14)
    end

    it 'should return less than 273 for the input', :api_dependant do
      @day = AOC202408.new(AOCInputFetcher.get_input(2024, 8))
      expect(@day.part1).to eq(273)
    end
  end

  describe 'part 2' do
    it 'should return 34 for the example' do
      @sample = AOC202408.new(SAMPLE_DATA_8)
      expect(@sample.part2).to eq(34)
    end

    it 'should return 1017 for the input', :api_dependant do
      @day = AOC202408.new(AOCInputFetcher.get_input(2024, 8))
      expect(@day.part2).to eq(1017)
    end
  end
end
