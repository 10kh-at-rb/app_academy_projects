require 'tdd'

describe 'Array#my_uniq' do
  it "returns the uniq elements" do
    array = [1,2,1,3,3]
    expect(array.my_uniq).to eq([1,2,3])
  end
  it "doesn't change the order in which they first appeared" do
    array = [5,7,5,4,5,7]
    expect(array.my_uniq).to eq([5,7,4])
  end
end

describe 'Array#two_sum' do
  it "find a pair that sums to 0" do
    array = [-1, 2, -2]
    expect(array.two_sum).to eq([[1, 2]])
  end

  it "returns two pairs in order" do
    array = [-1,2,-2,1]
    expect(array.two_sum).to eq([[0,3], [1,2]])
  end
  it "doesn't return a lone zero index" do
    array = [-1, 0,2,-2,1]
    expect(array.two_sum).to eq([[0,4], [2,3]])
  end
end

describe 'Array#my_transpose' do
  let(:sq_matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }

  let(:tall_matrix) { [
    [0, 1],
    [3, 4],
    [6, 7]
  ] }

  let(:wide_matrix) { [
    [0, 3, 6],
    [1, 4, 7]
  ] }

  it "transposes a square matrix" do
    expect(sq_matrix.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
  end

  it "transposes a tall rectangular matrix" do
    expect(tall_matrix.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7]
  ])
  end
  it "transposes a wide rectangular matrix" do
    expect(wide_matrix.my_transpose).to eq([
      [0, 1],
      [3, 4],
      [6, 7]
    ])
  end
  it "doesn't affect the original array" do
    sq_matrix2 = sq_matrix.my_transpose
    expect(sq_matrix).to eq(sq_matrix)
  end
end

describe '#stock_picker' do
  it "returns an empty array if given no days" do
    prices = []
    expect(stock_picker(prices)).to eq([])
  end

  it "doesn't modify the original array" do
    prices = [1,2,3,4]
    answer = stock_picker(prices)
    expect(prices).to eq([1,2,3,4])
  end

  it "gives a correct answer" do
    prices = [3, 1, 10, 5, 4, 12]
    expect(stock_picker(prices)).to eq([1,5])
  end
  it "doesn't sell first and buy second" do
    prices = [3, 1, 10, 5, 4, 12, 0]
    expect(stock_picker(prices)).to eq([1,5])
  end
end
