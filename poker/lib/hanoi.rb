class Hanoi

  attr_accessor :towers

  def self.default_towers
    towers = []
    towers << (1..3).to_a.reverse
    2.times { towers << [] }
    towers
  end

  def initialize
    @towers = Hanoi.default_towers
  end

  def render
    render_str="tower1: #{towers[0].join(" ")}\n"
    render_str << "tower2: #{towers[1].join(" ")}\n"
    render_str << "tower3: #{towers[2].join(" ")}"
  end

  def display
    puts render
  end

  def move(from, to)
    raise "can't select empty tower" if towers[from].empty?
    if !towers[to].empty? && towers[from].last > towers[to].last
      raise "can't move a bigger disc onto a smaller disc"
    end
    disc = towers[from].pop
    towers[to] << disc
  end

  def won?
    if towers == [[], [3,2,1], []] || towers == [[], [], [3,2,1]]
      return true
    end
    false
  end
end
