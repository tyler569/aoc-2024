require './grid'

describe Grid do
  it "should have a width and height" do
    grid = Grid.empty(5, 10)
    expect(grid.cols).to eq(5)
    expect(grid.rows).to eq(10)
  end

  it "should be able to store a value at a given position" do
    grid = Grid.empty(5, 10)
    grid[2, 3] = 42
    expect(grid[2, 3]).to eq(42)
  end

  it "should not allow to set a value outside of the grid" do
    grid = Grid.empty(5, 10)
    expect { grid[5, 10] = 42 }.to raise_error ArgumentError
  end

  it "should return nil for a value outside of the grid" do
    grid = Grid.empty(5, 10)
    expect(grid[5, 10]).to be_nil
  end

  it "should be able to create a grid from a string" do
    grid = Grid.from_string("1 2 3\n4 5 6", " ")
    expect(grid.cols).to eq(3)
    expect(grid.rows).to eq(2)
    expect(grid[0, 0]).to eq("1")
    expect(grid[1, 0]).to eq("2")
    expect(grid[2, 0]).to eq("3")
    expect(grid[0, 1]).to eq("4")
    expect(grid[1, 1]).to eq("5")
    expect(grid[2, 1]).to eq("6")
  end
end
