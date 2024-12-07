RSpec.configure do |config|
  config.before(:each, :api_dependant) do
    if ENV['AOC_SESSION'].nil?
      skip 'This test requires a valid session cookie to be set in the AOC_SESSION environment variable'
    end
  end
end
