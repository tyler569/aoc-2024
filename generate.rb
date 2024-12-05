#!/usr/bin/env ruby

require 'erb'

# Template for the main Ruby file
MAIN_TEMPLATE = <<~ERB
  #!/usr/bin/env ruby

  require './get_input'

  class AOC2024<%= "%02d" % day %>
    def initialize(input)
      @input = input
      parse!
    end

    def part1
    end

    def part2
    end

    def parse!
    end
  end

  def main
    input = AOCInputFetcher.get_input(2024, <%= day %>)
    day = AOC2024<%= "%02d" % day %>.new(input)
    puts "Day <%= day %> Part 1: \#{day.part1}"
    puts "Day <%= day %> Part 2: \#{day.part2}"
  end

  main if __FILE__ == $PROGRAM_NAME
ERB

# Template for the spec file
SPEC_TEMPLATE = <<~ERB
  #!/usr/bin/env ruby

  require './<%= "%02d" % day %>'

  describe 'AOC 2024 day <%= day %>' do
    SAMPLE_DATA_<%= day %> = <<~EOD
    EOD

    before(:all) do
      @sample = AOC2024<%= "%02d" % day %>.new(SAMPLE_DATA_<%= day %>)
      @day = AOC2024<%= "%02d" % day %>.new(AOCInputFetcher.get_input(2024, <%= day %>))
    end

    describe 'part 1' do
      # it 'should return 18 for the example' do
      #   expect(@sample.part1).to eq(18)
      # end

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
ERB

def generate_file(template, output_path, day)
  renderer = ERB.new(template)
  File.write(output_path, renderer.result_with_hash(day: day))
  puts "Generated #{output_path}"
end

def main
  unless ARGV.length == 1 && ARGV[0].to_i.between?(1, 25)
    puts "Usage: ruby generate.rb <day_number>"
    puts "Example: ruby generate.rb 6"
    exit 1
  end

  day = ARGV[0].to_i
  main_file = format('%02d.rb', day)
  spec_file = format('%02d-spec.rb', day)

  generate_file(MAIN_TEMPLATE, main_file, day)
  generate_file(SPEC_TEMPLATE, spec_file, day)
end

main if __FILE__ == $PROGRAM_NAME
