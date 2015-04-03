class Array
  def my_uniq
    [].tap do |uniq|
      self.each do |el|
        uniq << el if !uniq.include?(el)
      end
    end
  end

  def two_sum
    [].tap do |sums|
      self.each_with_index do |el, i|
        (i+1...self.length).each do |i2|
          sums << [i, i2] if self[i] + self[i2] == 0
        end
      end
    end
  end

  def my_transpose
    row_count = self.count
    col_count = self[0].count
    result = Array.new(col_count) { Array.new(row_count) }

    self.each_with_index do |rows, r_idx|
      rows.each_index do |c_idx|
        result[c_idx][r_idx] = self[r_idx][c_idx]
      end
    end

    result
  end
end

def stock_picker(prices)
  return [] if prices.empty?
  highest_profit = 0
  best_pair = []

  prices.each_index do |buy|
    (buy + 1...prices.count).each do |sell|
      profit = prices[sell] - prices[buy]

      if  profit > highest_profit
        highest_profit = profit
        best_pair = [buy, sell]
      end
    end
  end

  best_pair
end
