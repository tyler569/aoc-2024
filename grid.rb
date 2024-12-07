class Grid
  attr_reader :cols, :rows

  def initialize(data, c, r)
    @grid = data
    @cols = c
    @rows = r
  end

  def self.from_2darray(data)
    c = data[0].size
    r = data.size
    new(data.flatten, c, r)
  end

  def self.from_strings(data, col_delim = '')
    data = data.map { |l| l.split(col_delim) }
    from_2darray(data)
  end

  def self.from_string(data, col_delim = '')
    from_strings(data.split("\n"), col_delim)
  end

  def self.empty(c, r)
    new(Array.new(c * r), c, r)
  end

  def size
    [@cols, @rows]
  end

  def index(c, r)
    r * @cols + c
  end

  def [](c, r)
    if r < 0 || r >= @rows || c < 0 || c >= @cols
      nil
    else
      @grid[index(c, r)]
    end
  end

  def []=(c, r, value)
    if r < 0 || r >= @rows || c < 0 || c >= @cols
      raise ArgumentError, 'Out of bounds'
    else
      @grid[index(c, r)] = value
    end
  end

  def to_s
    @grid.each_slice(@cols).map { |row| row.join('') }.join("\n")
  end
end
