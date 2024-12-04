#!/usr/bin/env ruby

require './get_input'

class AOC202404
  def initialize(input)
    @input = input
    @search_string = 'XMAS'
    parse!
  end

  def part1
    count = 0
    @letters.each_with_index do |row, r|
      row.each_with_index do |letter, c|
        count += check_neighbors(r, c) if letter == @search_string[0]
      end
    end

    count
  end

  def part2
    count = 0
    @letters.each_with_index do |row, r|
      row.each_with_index do |letter, c|
        count += 1 if letter == 'A' && check_x(r, c)
      end
    end

    count
  end

  private

  def parse!
    @letters = @input.split("\n").map do |line|
      line.split('')
    end
  end

  def check_neighbors(r, c)
    count = 0
    count += 1 if check_direction(r, c, 0, 1) # right
    count += 1 if check_direction(r, c, 1, 0) # down
    count += 1 if check_direction(r, c, -1, 0) # up
    count += 1 if check_direction(r, c, 0, -1) # left
    count += 1 if check_direction(r, c, 1, 1) # down right
    count += 1 if check_direction(r, c, -1, -1) # up left
    count += 1 if check_direction(r, c, 1, -1) # down left
    count += 1 if check_direction(r, c, -1, 1) # up right
    count
  end

  def check_direction(r, c, dr, dc)
    cr = r + dr
    cc = c + dc

    (1..@search_string.size - 1).each do |ci|
      return false if cr < 0 || cr >= @letters.size
      return false if cc < 0 || cc >= @letters[0].size
      return false if @letters[cr][cc] != @search_string[ci]

      cr += dr
      cc += dc
    end

    true
  end

  def check_x(r, c)
    return false if r < 1 || r >= @letters.size - 1
    return false if c < 1 || c >= @letters[0].size - 1

    corners = [
      @letters[r - 1][c - 1],
      @letters[r - 1][c + 1],
      @letters[r + 1][c + 1],
      @letters[r + 1][c - 1],
    ]

    corners.all? { |c| c == 'M' || c == 'S' } &&
      corners.count('M') == 2 &&
      corners.count('S') == 2 &&
      corners[0] != corners[2] &&
      corners[1] != corners[3]
  end
end

def main
  input = AOCInputFetcher.get_input(2024, 4)
  day = AOC202404.new(input)
  puts "Day 4 Part 1: #{day.part1}"
  puts "Day 4 Part 2: #{day.part2}"
end

main if __FILE__ == $PROGRAM_NAME
