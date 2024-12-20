#!/usr/bin/env ruby

require 'rspec'
require './spec_helper'
require './03'

describe 'AOC 2024 day 3' do
  SAMPLE_DATA_3 = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  SAMPLE_DATA_3_2 = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

  describe 'part 1' do
    it 'should return 161 for the example' do
      @sample = AOC202403.new(SAMPLE_DATA_3)
      expect(@sample.part1).to eq(161)
    end

    it 'should return 165225049 for the input', :api_dependant do
      @day = AOC202403.new(AOCInputFetcher.get_input(2024, 3))
      expect(@day.part1).to eq(165225049)
    end
  end

  describe 'part 2' do
    it 'should return 48 for the example' do
      @sample = AOC202403.new(SAMPLE_DATA_3_2)
      expect(@sample.part2).to eq(48)
    end

    it 'should return 108830766 for the input', :api_dependant do
      @day = AOC202403.new(AOCInputFetcher.get_input(2024, 3))
      expect(@day.part2).to eq(108830766)
    end
  end
end
