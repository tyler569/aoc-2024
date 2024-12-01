require 'net/http'
require 'fileutils'
require 'uri'

module AOCInputFetcher
  CACHE_DIR = File.expand_path('~/.cache/aoc')

  # Fetch Advent of Code input for a given year and day
  # Arguments:
  # - year (Integer): The Advent of Code year
  # - day (Integer): The Advent of Code day
  # Returns:
  # - String: The input for the specified year and day
  def self.get_input(year, day)
    session_token = ENV['AOC_SESSION']
    unless session_token
      raise "Please set your Advent of Code session token in the AOC_SESSION environment variable."
    end

    cache_file = File.join(CACHE_DIR, year.to_s, day.to_s)

    # Return cached input if it exists
    if File.exist?(cache_file)
      return File.read(cache_file)
    end

    # Fetch the input from the Advent of Code website
    fetch_from_web(year, day, session_token, cache_file)
  end

  private

  def self.fetch_from_web(year, day, session_token, cache_file)
    url = URI("https://adventofcode.com/#{year}/day/#{day}/input")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request['Cookie'] = "session=#{session_token}"
    request['User-Agent'] = "AOC input fetcher by github.com/tyler569 / tyler@tylerphilbrick.com"

    response = http.request(request)

    if response.code.to_i == 200
      # Ensure the cache directory exists
      FileUtils.mkdir_p(File.dirname(cache_file))
      # Write the input to the cache
      File.write(cache_file, response.body)
      response.body
    else
      raise "Failed to fetch input: #{response.code} #{response.message}"
    end
  end
end

