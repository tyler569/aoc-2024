#!/usr/bin/env ruby

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

  before(:all) do
    @sample = AOC202405.new(SAMPLE_DATA_5)
    # @day = AOC202405.new(AOCInputFetcher.get_input(2024, 5))
  end

  describe 'part 1' do
    it 'should return 143 for the example' do
      expect(@sample.part1).to eq(143)
    end

    # it 'should return 279 for the input' do
    #   expect(@day.part1).to eq(2654)
    # end
  end

  describe 'part 2' do
    # it 'should return 9 for the example' do
    #   expect(@sample.part2).to eq(9)
    # end

    # it 'should return 1990 for the input' do
    #   expect(@day.part2).to eq(1990)
    # end
  end
end
