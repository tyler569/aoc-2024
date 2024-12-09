#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './09'

describe 'AOC 2024 day 9' do
  SAMPLE_DATA_9 = "2333133121414131402"

  describe 'part 1' do
    it 'should return 1928 for the example' do
      @sample = AOC202409.new(SAMPLE_DATA_9)
      expect(@sample.part1).to eq(1928)
    end

    # it 'should return 0 for the input', :api_dependant do
    #   @day = AOC202409.new(AOCInputFetcher.get_input(2024, 9)
    #   expect(@day.part1).to eq(0)
    # end
  end

  describe 'part 2' do
    # it 'should return 0 for the example' do
    #   @sample = AOC202409.new(SAMPLE_DATA_9)
    #   expect(@sample.part2).to eq(0)
    # end

    # it 'should return 0 for the input', :api_dependant do
    #   @day = AOC202409.new(AOCInputFetcher.get_input(2024, 9)
    #   expect(@day.part2).to eq(0)
    # end
  end
end
