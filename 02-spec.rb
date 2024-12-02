#!/usr/bin/env ruby

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

  before(:all) do
    @sample = AOC202402.new(SAMPLE_DATA_2)
    @day = AOC202402.new(AOCInputFetcher.get_input(2024, 2))
  end

  describe 'part 1' do
    it 'should return 2 for the example' do
      expect(@sample.part1).to eq(2)
    end

    it 'should return 279 for the input' do
      expect(@day.part1).to eq(279)
    end
  end

  describe 'part 2' do
    it 'should return 4 for the example' do
      expect(@sample.part2).to eq(4)
    end

    it 'should return 343 for the input' do
      expect(@day.part2).to eq(343)
    end
  end
end

